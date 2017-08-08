#
# Author:: Nathan L Smith (nlloyds@gmail.com)
# Author:: Marius Ducea (marius@promethost.com)
# Cookbook Name:: nodejs
# Recipe:: package
#
# Copyright 2012, Cramer Development, Inc.
# Copyright 2013, Opscale
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

include_recipe 'nodejs::repo' if node['nodejs']['install_repo']

if platform?('windows')
  platform = 'win'
  extension = 'msi'
  arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'
  engine = node['nodejs']['engine']

  if node['nodejs']['package']['url']
    nodejs_package_url = node['nodejs']['package']['url']
    checksum = node['nodejs']['package']['checksum']
  else
    prefix = node['nodejs']['prefix_url'][engine]
    nodejs_package_url = "#{prefix}/v#{node['nodejs']['version']}/#{engine}-v#{node['nodejs']['version']}-#{arch}.#{extension}"
  end

  if checksum.nil?
    checksum = node['nodejs']['binary']['checksum']["#{platform}_#{arch}"]
  end

  if checksum.nil?
    checksum = node['nodejs']['checksum'][node['nodejs']['version']][platform][arch][extension]
  end

  windows_package engine do
    source nodejs_package_url
    checksum checksum
    action :install
  end
else
  unless node['nodejs']['packages']
    Chef::Log.error 'No package for nodejs'
    Chef::Log.warn 'Please use the source or binary method to install node'
    return
  end

  node['nodejs']['packages'].each do |node_pkg|
    package node_pkg
  end
end
