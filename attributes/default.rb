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

default['nodejs']['install_method'] = 'source'
default['nodejs']['version'] = '0.8.16'
default['nodejs']['checksum'] = '2cd09d4227c787d6886be45dc54dad5aed779d7bd4b1e15ba930101d9d1ed2a4'
default['nodejs']['dir'] = '/usr/local'
default['nodejs']['npm'] = '1.2.0'
default['nodejs']['src_url'] = "http://nodejs.org/dist"
