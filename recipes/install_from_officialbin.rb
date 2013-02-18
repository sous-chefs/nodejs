
# Shamelessly borrowed from http://docs.opscode.com/dsl_recipe_method_platform.html
# Surely there's a more canonical way to get arch?
arch = node['kernel']['machine'] =~ /x86_64/ ? "x64" : "x86"
distro_suffix = "-linux-#{arch}"

nodejs_tar = "node-v#{node['nodejs']['version']}#{distro_suffix}.tar.gz"
nodejs_tar_path = nodejs_tar
if node['nodejs']['version'].split('.')[1].to_i >= 5
  nodejs_tar_path = "v#{node['nodejs']['version']}/#{nodejs_tar_path}"
end
# Let the user override the source url in the attributes
nodejs_bin_url = "#{node['nodejs']['src_url']}/#{nodejs_tar_path}"


# Download it:
remote_file "/usr/local/src/#{nodejs_tar}" do
  source nodejs_bin_url
  checksum node['nodejs']["checksum_linux_#{arch}"]
  mode 0644
  action :create_if_missing
end

# Unpack it
unpacked_path = "/usr/local/src/node-v#{node['nodejs']['version']}#{distro_suffix}"
execute "tar --no-same-owner -zxf #{nodejs_tar}" do
  cwd "/usr/local/src"
  creates unpacked_path
end

# And we're taking the easy option of using rsync to install everything:
package "rsync"

destination_dir = node['nodejs']['dir']

execute "install package to system" do
    cwd unpacked_path
    command "rsync -a --no-owner bin include lib share #{destination_dir}/"
    not_if {File.exists?("#{node['nodejs']['dir']}/bin/node") && `#{node['nodejs']['dir']}/bin/node --version`.chomp == "v#{node['nodejs']['version']}" }
end
