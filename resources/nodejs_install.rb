# frozen_string_literal: true

provides :nodejs_install
unified_mode true

use '_partial/_nodejs'

property :install_method, String, equal_to: %w(package binary source chocolatey)
property :install_repository, [true, false], default: true
property :packages, [Array, nil], default: nil
property :package_action, [Symbol, String], default: :install
property :package_options, [String, nil]
property :disable_dnf_module, [true, false], default: true
property :source_url, [String, nil]
property :source_checksum, [String, nil], default: NodeJs::Helper::DEFAULT_SOURCE_CHECKSUM
property :binary_url, [String, nil]
property :binary_checksums, Hash, default: NodeJs::Helper::DEFAULT_BINARY_CHECKSUMS
property :append_env_path, [true, false], default: true
property :make_threads, [Integer, String, nil], default: nil
property :build_packages, [Array, nil], default: nil
property :chocolatey_package_name, String, default: 'nodejs-lts'

default_action :install

action :install do
  case requested_install_method
  when 'package'
    nodejs_repository 'nodesource' do
      node_major node_major_from_version(new_resource.version)
      action :create
      only_if { new_resource.install_repository }
    end

    dnf_module 'nodejs' do
      action :disable
      only_if { disable_dnf_module? }
    end

    resolved_packages.each do |pkg|
      package pkg do
        action new_resource.package_action.to_sym
        options new_resource.package_options if new_resource.package_options
      end
    end
  when 'binary'
    package 'tar' if platform_family?('rhel', 'fedora', 'amazon', 'suse')

    ark 'nodejs-binary' do
      url nodejs_binary_url(new_resource.version, new_resource.prefix_url, new_resource.binary_url)
      version new_resource.version
      checksum nodejs_binary_checksum(new_resource.binary_checksums) unless new_resource.binary_url
      has_binaries %w(bin/node bin/npm bin/npx)
      append_env_path new_resource.append_env_path
      action :install
    end
  when 'source'
    build_essential 'install build tools'

    (new_resource.build_packages || default_build_packages).each do |pkg|
      if dnf_python_package?(pkg)
        execute 'install python3 build package' do
          command 'dnf -y install python3'
          not_if 'command -v python3'
          only_if 'command -v dnf'
        end
      else
        package pkg
      end
    end

    link '/usr/local/bin/python' do
      to '/usr/bin/python3'
      not_if 'command -v python'
      only_if 'command -v python3'
    end

    ark 'nodejs-source' do
      url nodejs_source_url(new_resource.version, new_resource.prefix_url, new_resource.source_url)
      version new_resource.version
      checksum new_resource.source_checksum if new_resource.source_checksum
      make_opts ["-j #{new_resource.make_threads || default_make_threads}"]
      environment(PYTHON: 'python3')
      action :install_with_make
    end
  when 'chocolatey'
    chocolatey_package new_resource.chocolatey_package_name do
      version new_resource.version if new_resource.version
      action :upgrade
    end
  end
end

action :remove do
  case requested_install_method
  when 'package'
    resolved_packages.each do |pkg|
      package pkg do
        action :remove
      end
    end

    nodejs_repository 'nodesource' do
      action :remove
      only_if { new_resource.install_repository }
    end
  when 'binary'
    ark 'nodejs-binary' do
      action :remove
    end
  when 'source'
    ark 'nodejs-source' do
      action :remove
    end
  when 'chocolatey'
    chocolatey_package new_resource.chocolatey_package_name do
      action :remove
    end
  end
end

action_class do
  include NodeJs::Helper

  def requested_install_method
    new_resource.install_method || default_install_method
  end

  def resolved_packages
    new_resource.packages || default_packages(new_resource.install_repository)
  end

  def disable_dnf_module?
    new_resource.disable_dnf_module &&
      platform_family?('rhel', 'fedora') &&
      node['platform_version'].to_i >= 8 &&
      dnf_module_available?('nodejs')
  end

  def dnf_module_available?(module_name)
    shell_out!("dnf -q module list #{module_name}", returns: [0, 1]).stdout.match?(/^#{Regexp.escape(module_name)}\s/m)
  end
end
