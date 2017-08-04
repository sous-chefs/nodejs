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

Chef::Recipe.send(:include, NodeJs::Helper)

include_recipe 'build-essential'

case node['platform_family']
when 'rhel', 'fedora', 'amazon'
  package 'openssl-devel', 'tar'
when 'debian'
  package 'libssl-dev'
end

version = "v#{node['nodejs']['version']}/"
prefix = node['nodejs']['prefix_url']['node']
extension = 'tar.gz'
filename = "node-v#{node['nodejs']['version']}.#{extension}"
archive_name = 'nodejs-source'

nodejs_src_url = node['nodejs']['source']['url'] || ::URI.join(prefix, version, filename).to_s
checksum = node['nodejs']['source']['checksum'] || node['nodejs']['checksum'][node['nodejs']['version']][extension]

ark archive_name do
  url nodejs_src_url
  version node['nodejs']['version']
  checksum checksum
  make_opts ["-j #{node['nodejs']['make_threads']}"]
  action :install_with_make
end
