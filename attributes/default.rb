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

default['nodejs']['version'] = '6.3.0'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'
default['nodejs']['prefix_url']['iojs'] = 'https://iojs.org/dist/'

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = '4ed7a99985f8afee337cc22d5fef61b495ab4238dfff3750ac9019e87fc6aae6'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = 'd26c09fc95ebb457b79fcb0a2890fe8417b2c04f4016dadf2d165c07af762764'
default['nodejs']['binary']['checksum']['linux_x86'] = '9302affb9844ec9a51e774169072bff3421c0232f746b3d504ba6c13c749ff9f'
default['nodejs']['binary']['checksum']['linux_arm64'] = '58995c3f91962fc4383696f9c64763b3cd27d9b5903b4cf2a5ccfe86c8258e9f'

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2
