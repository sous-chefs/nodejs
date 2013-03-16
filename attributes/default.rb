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
default['nodejs']['version'] = '0.10.0'
default['nodejs']['checksum'] = '1624dc37866ebfb5431e3393e6b049cf238cac8ad4d20c6d567263b1259177ab'
default['nodejs']['checksum_linux_x64'] = 'eaedcf7e3e443cf2fa35f834ed62b334885dc20fcbc7a32ea34e8e85f81b2533'
default['nodejs']['checksum_linux_x86'] = 'ea4508e4df3c74d964a02d5740374b54f8192af19db518163c77ee7ff318daa7'
default['nodejs']['dir'] = '/usr/local'
default['nodejs']['npm'] = '1.2.0'
default['nodejs']['src_url'] = "http://nodejs.org/dist"

# Set this to true to install the legacy packages (0.8.x) from ubuntu/debian repositories; default is false (using the latest stable 0.10.x)
default['nodejs']['legacy_packages'] = false
