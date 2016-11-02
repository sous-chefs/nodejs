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

case node['platform_family']
when 'smartos', 'rhel', 'debian', 'fedora', 'mac_os_x'
  default['nodejs']['install_method'] = 'package'
else
  default['nodejs']['install_method'] = 'source'
end

default['nodejs']['engine'] = 'node' # or iojs

default['nodejs']['version'] = '6.9.1'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'
default['nodejs']['prefix_url']['iojs'] = 'https://iojs.org/dist/'

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = '0bdd8d1305777cc8cd206129ea494d6c6ce56001868dd80147aff531d6df0729'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = 'd4eb161e4715e11bbef816a6c577974271e2bddae9cf008744627676ff00036a'
default['nodejs']['binary']['checksum']['linux_x86'] = 'f9b2ca03016e45bc35d2441a63a73db94d3e7b92350f15577d796467b9f7efb0'
default['nodejs']['binary']['checksum']['linux_arm64'] = '7aa69b6c8cff578d0d97d5bd4f76941b2fade5476f0408d53828666ee427dd4e'

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2
