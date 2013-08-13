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
default['nodejs']['version'] = '0.10.13'
default['nodejs']['checksum'] = '7e2079394efe82f62798178f617888c9d6a39150c76122c432ae9ea73ce28e79'
default['nodejs']['checksum_linux_x64'] = '83b8f07aa7981694e557a9aae7e5bc4c312d800c'
default['nodejs']['checksum_linux_x86'] = 'ec016d282d85036151dc096cd5cee6c8bd20fdd8'
default['nodejs']['dir'] = '/usr/local'
default['nodejs']['npm'] = '1.3.4'
default['nodejs']['src_url'] = "http://nodejs.org/dist"
default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

# Set this to true to install the legacy packages (0.8.x) from ubuntu/debian repositories; default is false (using the latest stable 0.10.x)
default['nodejs']['legacy_packages'] = false
