#
# Author:: Marius Ducea (marius@promethost.com)
# Cookbook Name:: nodejs
# Recipe:: npm
#
# Copyright 2010, Promet Solutions
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

include_recipe "nodejs"

bash "install npm - package manager for node" do
  cwd "/usr/local/src"
  user "root"
  code <<-EOH
    mkdir -p npm-v#{node[:nodejs][:npm]} && \
    cd npm-v#{node[:nodejs][:npm]}
    curl -L http://github.com/isaacs/npm/tarball/v#{node[:nodejs][:npm]} | tar xzf - --strip-components=1 && \
    make uninstall install
  EOH
  not_if {File.exists?("/usr/local/bin/npm@#{node[:nodejs][:npm]}")}
end

