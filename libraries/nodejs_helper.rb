module NodeJs
  module Helper
    def install_not_needed?
      cmd = Mixlib::ShellOut.new("#{node['nodejs']['node_bin']} --version")
      version = cmd.run_command.stdout.chomp
      ::File.exists?("#{node['nodejs']['dir']}/bin/node") && version == "v#{node['nodejs']['version']}"
    end
  end
end
