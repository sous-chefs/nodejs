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

default['nodejs']['version'] = '17.9.0'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'

default['nodejs']['tmpdir'] = '/tmp'
default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = '25d8c6559456d548823e3f7f4fae7dc8c7d5a0f7772c79c8d902528e801ba09a'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = '8c9f4c95c254336fcb2c768e746f4316b8176adc0fb599cbbb460d0933991d12'
default['nodejs']['binary']['checksum']['linux_arm64'] = 'd4acf5c0380c96c867428d0232666d3327dc5fa83a694d7b63f728a76ece84b2'
default['nodejs']['binary']['append_env_path'] = true

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true
