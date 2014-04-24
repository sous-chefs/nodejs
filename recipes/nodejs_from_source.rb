#
# Author:: Marius Ducea (marius@promethost.com)
# Cookbook Name:: nodejs
# Recipe:: source
#
# Copyright 2010-2012, Promet Solutions
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

include_recipe 'build-essential'

case node['platform_family']
when 'rhel', 'fedora'
  package 'openssl-devel'
when 'debian'
  package 'libssl-dev'
end

filename = "node-v#{node['nodejs']['version']}.tar.gz"

if node['nodejs']['source']['url']
  # See disparaging comments in nodejs_from_binary.rb
  nodejs_src_url = node['nodejs']['source']['url']
  checksum = node['nodejs']['source']['checksum']
else
  nodejs_version_url = ::URI.join(node['nodejs']['prefix_url'], "v#{node['nodejs']['version']}/").to_s
  nodejs_src_url = ::URI.join(nodejs_version_url, filename).to_s
  checksum = get_checksum(::URI.join(nodejs_version_url, 'SHASUMS256.txt').to_s, filename)
end

ark 'nodejs-source' do
  url nodejs_src_url
  version node['nodejs']['version']
  checksum checksum
  has_binaries ['bin/node', 'bin/npm']
  action :install_with_make
end
