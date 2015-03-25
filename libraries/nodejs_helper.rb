# Provide some helpers for the NPM wrapper
module NodeJs
  # Provide some helpers for the NPM wrapper
  module Helper
    def npm_list(path = nil)
      require 'json'
      if path
        cmd = Mixlib::ShellOut.new('npm list -json', cwd: path)
      else
        cmd = Mixlib::ShellOut.new('npm list -global -json')
      end
      JSON.parse(cmd.run_command.stdout, max_nesting: false)
    end

    def npm_package_installed?(package, version = nil, path = nil)
      list = npm_list(path)['dependencies']
      # Return true if package installed and installed to good version
      (!list.nil?) && list.key?(package) && (version ? list[package]['version'] == version : true)
    end
  end
end
