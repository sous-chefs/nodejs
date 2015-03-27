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

# Choose between 'node' and 'iojs'
default['nodejs']['fork'] = 'node'
default['nodejs']['node']['version'] = '0.10.38'
default['nodejs']['iojs']['version'] = '1.6.2'
default['nodejs']['npm']['version'] = 'latest'

default['nodejs']['node']['prefix_url'] = 'https://nodejs.org/dist/'
default['nodejs']['iojs']['prefix_url'] = 'https://iojs.org/dist/'

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['node']['checksums'] = {
  '0.10.38' => {
    'x64' => 'd0f5771c3adefa4a3c1718206521c603526a3b67d5b1b66abd2e155d0fb77f5e',
    'x86' => '08ec8c049b2ed1990624661707682460332bb988d1b8b9ad394d71138179eafa'
  }
}
default['nodejs']['iojs']['checksums'] = {
  '1.6.2' => {
    'x64' => '1598b95cb6e1a4b664ea0a8fc69d0cf53e597bbd1164a94966fc3e34f63a7447',
    'x86' => 'fc82c32221c48d1021b1bee5867bf8c54ae2d5914c7d1f8281be587ad4307576'
  }
}
