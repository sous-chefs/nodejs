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

default['nodejs']['install_method'] = if platform_family?('smartos', 'rhel', 'debian', 'fedora', 'mac_os_x', 'suse', 'amazon')
                                        'package'
                                      else
                                        'source'
                                      end

default['nodejs']['version'] = '10.16.3'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = 'db5a5e03a815b84a1266a4b48bb6a6d887175705f84fd2472f0d28e5e305a1f8'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = '2f0397bb81c1d0c9901b9aff82a933257bf60f3992227b86107111a75b9030d9'
default['nodejs']['binary']['checksum']['linux_arm64'] = '3bab16e7107092e43426e082ee9fd88ef0a43a35816f662f14563bcc5152600d'

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true
