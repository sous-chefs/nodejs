#
# Cookbook Name:: nodejs
# Attributes:: nodejs
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

default['nodejs']['install_method'] = 'source'
default['nodejs']['version'] = '0.10.6'
default['nodejs']['checksum'] = '7e2079394efe82f62798178f617888c9d6a39150c76122c432ae9ea73ce28e79'
default['nodejs']['checksum_linux_x64'] = 'cc7ccfce24ae0ebb0c50661ef8d98b5db07fc1cd4a222c5d1ae232260d5834ca'
default['nodejs']['checksum_linux_x86'] = 'e8c75ffa508bb86b6858855d33139d63013c55b398f2258b020a84d8071b13f3'
default['nodejs']['dir'] = '/usr/local'
default['nodejs']['npm'] = '1.2.14'
default['nodejs']['src_url'] = "http://nodejs.org/dist"
default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

# Set this to true to install the legacy packages (0.8.x) from ubuntu/debian repositories; default is false (using the latest stable 0.10.x)
default['nodejs']['legacy_packages'] = false
