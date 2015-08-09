module NodeJs
  module Helper
    def npm_dist
      if node['nodejs']['npm']['url']
        return { 'url' => node['nodejs']['npm']['url'] }
      else

        require 'open-uri'
        require 'json'
        result = JSON.parse(URI.parse("https://registry.npmjs.org/npm/#{node['nodejs']['npm']['version']}").read, :max_nesting => false)
        ret = { 'url' => result['dist']['tarball'], 'version' => result['_npmVersion'], 'shasum' => result['dist']['shasum'] }
        Chef::Log.debug("Npm dist #{ret}")
        return ret
      end
    end

    def npm_list(path = nil, environment = {}, nodejs_home = nil)
      require 'json'
      if path
        cmd = Mixlib::ShellOut.new('npm list -json', :cwd => path, :environment => environment)
      else
        cmd = Mixlib::ShellOut.new('npm list -global -json', :environment => environment)
      end

      nodejs_home = custom_nodejs_home(nodejs_home)

      cmd.environment['PATH'] = "#{nodejs_home}/bin:" + ENV['PATH'] if nodejs_home

      JSON.parse(cmd.run_command.stdout, :max_nesting => false)
    end

    def url_valid?(list, package)
      list.fetch(package, {}).fetch('resolved', '').include?('url')
    end

    def version_valid?(list, package, version)
      (version ? list[package]['version'] == version : true)
    end

    def npm_package_installed?(new_resource)
      package = new_resource.package
      version = new_resource.version
      path = new_resource.path
      nodejs_home = new_resource.nodejs_home
      npm_token = new_resource.npm_token

      environment = { 'NPM_TOKEN' => npm_token } if npm_token

      list = npm_list(path, environment, nodejs_home)['dependencies']
      # Return true if package installed and installed to good version
      (!list.nil?) && list.key?(package) && version_valid?(list, package, version) && url_valid?(list, package)
    end

    def npm_env_vars(new_resource)
      environment = {}
      if new_resource.user
        environment['HOME'] = ::Dir.home(new_resource.user)
        environment['USER'] = new_resource.user
      end

      environment['NPM_TOKEN'] = new_resource.npm_token if new_resource.npm_token

      nodejs_home = custom_nodejs_home(new_resource.nodejs_home)

      environment['PATH'] = "#{nodejs_home}/bin:" + ENV['PATH'] if nodejs_home

      environment
    end

    def custom_nodejs_home(nodejs_home)
      if nodejs_home.nil? && !node['nodejs']['install_path'].nil?
        nodejs_home = "#{node['nodejs']['install_path']}/#{node['nodejs']['install_directory_name']}"
      end

      custom_nodejs_home = !nodejs_home.nil? && !ENV['PATH'].include?(nodejs_home)

      return nodejs_home if custom_nodejs_home

      nil
    end
  end
end
