#
# Author:: Marius Ducea (marius@promethost.com)
# Cookbook Name:: nodejs
# Recipe:: default
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

arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'
fork = node['nodejs']['fork']
version = node['nodejs'][fork]['version']
prefix_url = node['nodejs'][fork]['prefix_url']
checksums = node['nodejs'][fork]['checksums']

# package_stub is for example: "node-v0.8.20-linux-x64.tar.gz"
filename = "#{fork}-v#{version}-linux-#{arch}.tar.gz"
if node['nodejs']['binary']['url']
  nodejs_bin_url = node['nodejs']['binary']['url']
else
  nodejs_bin_url = ::URI.join(prefix_url, "v#{version}/", filename).to_s
end

ark 'nodejs-binary' do
  url nodejs_bin_url
  version version
  checksum checksums[version][arch]
  has_binaries ['bin/node', 'bin/npm']
  action :install
end

nodejs_npm 'npm' do
  version node['nodejs']['npm']['version']
  options ['--force']
end
