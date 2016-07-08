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

default['nodejs']['version'] = '4.4.7'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'
default['nodejs']['prefix_url']['iojs'] = 'https://iojs.org/dist/'

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = 'cbe1c6e421969dd5639d0fbaa6d3c1f56c0463b87efe75be8594638da4d8fc4f'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = '5ad10465cc9d837c1fda8db0fd1bdc1a4ce823dd6afbc533ac2127e6a9a64133'
default['nodejs']['binary']['checksum']['linux_x86'] = '604c4f85ef00a13c172465c9672a2a0f13524921e255eeb75242afb42af6d814'
default['nodejs']['binary']['checksum']['linux_arm64'] = 'a1e2faf3859976ac7322b950353044863c2e36ad6e2e09a8fc9f80f72fd01b18'

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2
