#
# Cookbook:: nodejs
# Attributes:: nodejs
#
# Copyright:: 2010-2017, Promet Solutions
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
when 'smartos', 'rhel', 'debian', 'fedora', 'mac_os_x', 'suse', 'amazon'
  default['nodejs']['install_method'] = 'package'
when 'windows'
  default['nodejs']['install_method'] = 'chocolatey'
else
  default['nodejs']['install_method'] = 'source'
end

default['nodejs']['version'] = '10.15.3'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = 'db460a63d057ac015b75bb6a879fcbe2fefaaf22afa4b6f6445b9db61ce2270d'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = '6c35b85a7cd4188ab7578354277b2b2ca43eacc864a2a16b3669753ec2369d52'
default['nodejs']['binary']['checksum']['linux_arm64'] = 'c82cd99e01f6e26830f0b3e0465f12f92957ebd69a68c91c03228c2669104359'

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true
