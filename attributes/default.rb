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

default['nodejs']['install_method'] = case node['platform_family']
                                      when 'smartos', 'rhel', 'debian', 'fedora', 'mac_os_x', 'suse', 'amazon'
                                        'package'
                                      when 'windows'
                                        'chocolatey'
                                      else
                                        'source'
                                      end

default['nodejs']['version'] = '14.17.6'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'

default['nodejs']['tmpdir'] = '/tmp'
default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = 'f64559c87faa2f1ce93c3d2cd09723af254ec320a53cbfd1a2ba8fba28e488d0'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = '3bbe4faf356738d88b45be222bf5e858330541ff16bd0d4cfad36540c331461b'
default['nodejs']['binary']['checksum']['linux_arm64'] = '3355eae15582be48f6be0910e279abbf2324f4538d3ccb2da7e66edab6e6b0fe'
default['nodejs']['binary']['append_env_path'] = true

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true
