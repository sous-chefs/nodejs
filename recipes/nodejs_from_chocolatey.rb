#
# Author:: Hossein Margani (hossein@margani.dev)
# Cookbook:: nodejs
# Recipe:: install_from_chocolatey
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

chocolatey_package 'nodejs-lts' do
  version node['nodejs']['version']
  action :install
  only_if node['nodejs']['version']
end

chocolatey_package 'nodejs-lts' do
  action :install
  not_if node['nodejs']['version']
end
