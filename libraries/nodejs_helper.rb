# frozen_string_literal: true

module NodeJs
  module Helper
    DEFAULT_NODE_VERSION = '24.15.0' unless const_defined?(:DEFAULT_NODE_VERSION)
    DEFAULT_NODE_MAJOR = '24' unless const_defined?(:DEFAULT_NODE_MAJOR)
    DEFAULT_SOURCE_CHECKSUM = '729de494dd2872e5a3a6c32a1cd156a5413d4aca2772b2d873ee86bb5531bcd9' unless const_defined?(:DEFAULT_SOURCE_CHECKSUM)
    DEFAULT_BINARY_CHECKSUMS = {
      'linux_x64' => '44836872d9aec49f1e6b52a9a922872db9a2b02d235a616a5681b6a85fec8d89',
      'linux_arm64' => '73afc234d558c24919875f51c2d1ea002a2ada4ea6f83601a383869fefa64eed',
    }.freeze unless const_defined?(:DEFAULT_BINARY_CHECKSUMS)

    def default_install_method
      case node['platform_family']
      when 'debian', 'rhel', 'fedora', 'amazon', 'mac_os_x', 'suse'
        'package'
      when 'windows'
        'chocolatey'
      else
        'source'
      end
    end

    def default_packages(install_repository)
      case node['platform_family']
      when 'debian'
        install_repository ? ['nodejs'] : %w(nodejs npm nodejs-dev)
      when 'rhel', 'fedora', 'amazon'
        install_repository ? %w(nodejs nodejs-devel) : %w(nodejs npm nodejs-devel)
      when 'suse'
        %w(nodejs npm nodejs-devel)
      when 'mac_os_x'
        ['node']
      else
        ['nodejs']
      end
    end

    def default_build_packages
      case node['platform_family']
      when 'rhel', 'fedora', 'amazon'
        %w(openssl-devel python3 tar)
      when 'debian'
        %w(libssl-dev python3)
      else
        %w(python3)
      end
    end

    def default_make_threads
      node['cpu'] ? node['cpu']['total'].to_i : 2
    end

    def node_major_from_version(version)
      version.to_s.split('.').first
    end

    def nodejs_arch
      machine = node['kernel']['machine']

      case machine
      when /armv6l/
        'arm-pi'
      when /aarch64/
        'arm64'
      when /x86_64/
        'x64'
      when /\d86/
        'x86'
      else
        machine
      end
    end

    def nodejs_binary_checksum(checksums)
      checksums["linux_#{nodejs_arch}"]
    end

    def nodejs_source_url(version, prefix_url, source_url)
      source_url || ::URI.join(prefix_url, "v#{version}/", "node-v#{version}.tar.gz").to_s
    end

    def nodejs_binary_url(version, prefix_url, binary_url)
      binary_url || ::URI.join(prefix_url, "v#{version}/", "node-v#{version}-linux-#{nodejs_arch}.tar.gz").to_s
    end

    def npm_dist(version, url = nil)
      return { 'url' => url } if url

      require 'open-uri'
      require 'json'
      result = JSON.parse(URI.parse("https://registry.npmjs.org/npm/#{version}").read, max_nesting: false)
      ret = { 'url' => result['dist']['tarball'], 'version' => result['_npmVersion'], 'shasum' => result['dist']['shasum'] }
      Chef::Log.debug("Npm dist #{ret}")
      ret
    end

    def npm_list(package, path = nil, environment = {})
      require 'json'
      cmd = if path
              Mixlib::ShellOut.new("npm list #{package} -json", cwd: path, environment: environment)
            else
              Mixlib::ShellOut.new("npm list #{package} -global -json", environment: environment)
            end

      begin
        JSON.parse(cmd.run_command.stdout, max_nesting: false)
      rescue JSON::ParserError => e
        Chef::Log.error("nodejs::library::nodejs_helper::npm_list exception #{e}")
        {}
      end
    end

    def url_valid?(list, package)
      require 'open-uri'

      begin
        URI.parse(list.fetch(package, {}).fetch('resolved'))
      rescue KeyError
        # the package may have been installed without using a url
        true
      rescue URI::InvalidURIError
        false
      end
    end

    def version_valid?(list, package, version)
      (version ? list[package]['version'] == version : true)
    end

    def npm_package_installed?(package, version = nil, path = nil, environment = {})
      list = npm_list(package, path, environment)['dependencies']
      # Return true if package installed and installed to good version
      # see if we really want to add the url check
      !list.nil? && list.key?(package) && version_valid?(list, package, version) && url_valid?(list, package)
    end
  end
end
