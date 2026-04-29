# frozen_string_literal: true

provides :nodejs_repository
unified_mode true

property :repo_name, String, name_property: true
property :node_major, [String, Integer], default: NodeJs::Helper::DEFAULT_NODE_MAJOR
property :apt_uri, String
property :apt_distribution, String, default: 'nodistro'
property :apt_components, Array, default: ['main']
property :apt_key, String, default: 'https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key'
property :apt_keyring, String, default: '/etc/apt/keyrings/nodesource.asc'
property :apt_pin_priority, String, default: '600'
property :yum_baseurl, String
property :yum_gpgkey, String, default: 'https://rpm.nodesource.com/gpgkey/ns-operations-public.key'
property :yum_priority, String, default: '9'
property :enabled, [true, false], default: true
property :gpgcheck, [true, false], default: true

default_action :create

action :create do
  case node['platform_family']
  when 'debian'
    package %w(ca-certificates curl gnupg apt-transport-https)

    directory ::File.dirname(new_resource.apt_keyring) do
      recursive true
      mode '0755'
    end

    remote_file new_resource.apt_keyring do
      source new_resource.apt_key
      mode '0644'
    end

    apt_preference new_resource.repo_name do
      glob '*'
      pin 'origin deb.nodesource.com'
      pin_priority new_resource.apt_pin_priority
    end

    apt_repository new_resource.repo_name do
      uri lazy { new_resource.apt_uri || "https://deb.nodesource.com/node_#{new_resource.node_major}.x" }
      components new_resource.apt_components
      signed_by new_resource.apt_keyring
      distribution new_resource.apt_distribution
    end
  when 'rhel', 'fedora', 'amazon'
    yum_repository "#{new_resource.repo_name}-nodejs" do
      description 'nodesource.com nodejs repository'
      baseurl lazy { new_resource.yum_baseurl || "https://rpm.nodesource.com/pub_#{new_resource.node_major}.x/nodistro/nodejs/$basearch" }
      gpgkey new_resource.yum_gpgkey
      priority new_resource.yum_priority
      enabled new_resource.enabled
      gpgcheck new_resource.gpgcheck
      options(module_hotfixes: 1)
      action :create
    end
  end
end

action :remove do
  case node['platform_family']
  when 'debian'
    apt_repository new_resource.repo_name do
      action :remove
    end

    file new_resource.apt_keyring do
      action :delete
    end
  when 'rhel', 'fedora', 'amazon'
    yum_repository "#{new_resource.repo_name}-nodejs" do
      action :remove
    end
  end
end
