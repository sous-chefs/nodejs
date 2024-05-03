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

default['nodejs']['version'] = '18.19.1'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'

default['nodejs']['tmpdir'] = '/tmp'
default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = '637aa3f779a5a733657d4dde220747b82ab699075635990a9a611b00d2c20b09'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = '724802c45237477dbe5777923743e6c77906830cae03a82b5653ebd75b301dda'
default['nodejs']['binary']['checksum']['linux_arm64'] = '2913e8544d95c8be9e6034c539ec0584014532166a088bf742629756c3ec42e2'
default['nodejs']['binary']['append_env_path'] = true

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true
