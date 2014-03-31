#
# Author:: Julian Wilde (jules@jules.com.au)
# Cookbook Name:: nodejs
# Recipe:: install_from_binary
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

Chef::Resource::User.send(:include, NodeJs::Helper)

# Shamelessly borrowed from http://docs.opscode.com/dsl_recipe_method_platform.html
# Surely there's a more canonical way to get arch?
if node['kernel']['machine'] =~ /armv6l/
  arch = 'arm-pi' # assume a raspberry pi
else
  arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'
end

distro_suffix = "-linux-#{arch}"

# package_stub is for example: "node-v0.8.20-linux-x64"
package_stub = "node-v#{node['nodejs']['version']}#{distro_suffix}"
nodejs_tar = "#{package_stub}.tar.gz"
expected_checksum = node['nodejs']["checksum_linux_#{arch}"]

nodejs_tar_path = nodejs_tar
if node['nodejs']['version'].split('.')[1].to_i >= 5
  nodejs_tar_path = "v#{node['nodejs']['version']}/#{nodejs_tar_path}"
end

# Let the user override the source url in the attributes
nodejs_bin_url = "#{node['nodejs']['src_url']}/#{nodejs_tar_path}"

ark 'nodejs-binary' do
  url nodejs_bin_url
  version node['nodejs']['version']
  checksum expected_checksum
  action :install
end
