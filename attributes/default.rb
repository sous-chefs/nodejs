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
when 'smartos', 'rhel', 'debian', 'fedora', 'mac_os_x', 'windows'
  default['nodejs']['install_method'] = 'package'
else
  default['nodejs']['install_method'] = 'source'
end

default['nodejs']['engine'] = 'node' # or iojs

default['nodejs']['version'] = '6.9.1'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'
default['nodejs']['prefix_url']['iojs'] = 'https://iojs.org/dist/'

default['nodejs']['package']['url'] = nil # Auto generated
# Checksums are necessary for Windows. Here's the default checksums for 6.9.1
default['nodejs']['package']['checksum']['win_x64'] = '148aa14ce1491b2cdc47230c90e862e48d1af32baf5cc415b29593b6113ea1cf'
default['nodejs']['package']['checksum']['win_x86'] = '314eaf8b5b9e08a835cb5c005ea5f4299b9e9e4d8c97277c1617e511382c15dc'

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = '0bdd8d1305777cc8cd206129ea494d6c6ce56001868dd80147aff531d6df0729'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['win_install_dir'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = 'd4eb161e4715e11bbef816a6c577974271e2bddae9cf008744627676ff00036a'
default['nodejs']['binary']['checksum']['linux_x86'] = 'f9b2ca03016e45bc35d2441a63a73db94d3e7b92350f15577d796467b9f7efb0'
default['nodejs']['binary']['checksum']['linux_arm64'] = '7aa69b6c8cff578d0d97d5bd4f76941b2fade5476f0408d53828666ee427dd4e'
default['nodejs']['binary']['checksum']['win_x64'] = '6ea6768af81948bd0e54760d948f04e0ab182411b235d2067e45a1e2b9052bcb'
default['nodejs']['binary']['checksum']['win_x86'] = 'aec417a95b46a21fa13190ed3f9a22de8bc1ecec77f981102345b0c7165420bd'
default['nodejs']['binary']['checksum']['darwin_x64'] = '910395e1e98fb351c62b5702a9deef22aaecf05d6df1d7edc283337542207f3f'
default['nodejs']['binary']['checksum']['sunos_x64'] = 'd94202bc4567475ccca077f3f819a92c9d7f280bac688ec0506f9a31c3b19201'
default['nodejs']['binary']['checksum']['sunos_x86'] = '643d675ac6678745784b29ab829519d11c9832aa77095a9b611d71b7ac4d4321'

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2
