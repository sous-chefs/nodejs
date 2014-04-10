#
# Author:: Angel Abad <angelabad@gmail.com>
# Cookbook Name:: nodejs
# Recipe:: install_from_mac_pkg
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

filename = "node-v#{node['nodejs']['version']}.pkg"
url = node['nodejs']['mac_os_x']['url']
nodejs_mac_os_x_url = url ? url : ::URI.join(node['nodejs']['prefix_url'], filename).to_s

remote_file ::File.join(Chef::Config[:file_cache_path], 'node.pkg') do
  source nodejs_mac_os_x_url
  checksum node['nodejs']['mac_pkg']['checksum']
  notifies :run, 'execute[install nodejs on mac]', :immediately
end

execute 'install nodejs with mac_pkg' do
  command "installer -pkg #{Chef::Config[:file_cache_path]}/node.pkg -target /"
  action :nothing
  not_if "node --version | grep v#{node['nodejs']['version']}"
end
