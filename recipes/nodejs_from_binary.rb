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
Chef::Recipe.send(:include, NodeJs::Checksum)

# Shamelessly borrowed from http://docs.opscode.com/dsl_recipe_method_platform.html
# Surely there's a more canonical way to get arch?
if node['kernel']['machine'] =~ /armv6l/
  arch = 'arm-pi' # assume a raspberry pi
else
  arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'
end

# package_stub is for example: "node-v0.8.20-linux-x64.tar.gz"
filename = "node-v#{node['nodejs']['version']}-linux-#{arch}.tar.gz"


if node['nodejs']['binary']['url']
  # Assume you have a network security team that hasn't heard of UTM and imposes
  # silly restrictions like only installing software from internal package repositories;
  # you probably aren't using Node.JS anyway. Put a path and checksum here and go surf Dice.
  nodejs_bin_url = node['nodejs']['binary']['url']
  checksum = node['nodejs']['binary']['checksum']
else
  # or if you run your kit IN THE CLOUD! you can just find this stuff on the fly
  nodejs_version_url = ::URI.join(node['nodejs']['prefix_url'], "v#{node['nodejs']['version']}/").to_s
  nodejs_bin_url = ::URI.join(nodejs_version_url, filename).to_s
  checksum = get_checksum(::URI.join(nodejs_version_url, 'SHASUMS256.txt').to_s, filename)
end

ark 'nodejs-binary' do
  url nodejs_bin_url
  version node['nodejs']['version']
  checksum checksum
  has_binaries ['bin/node','bin/npm']
  action :install
end
