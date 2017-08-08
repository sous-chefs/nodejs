#
# Author:: Julian Wilde (jules@jules.com.au)
# Cookbook Name:: nodejs
# Recipe:: install_from_binary
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

Chef::Recipe.send(:include, NodeJs::Helper)

# FIXME: Handle s390x, ppc64, arm64, armv61, armv71, ppc64le
# Shamelessly borrowed from http://docs.chef.io/dsl_recipe_method_platform.html
# Surely there's a more canonical way to get arch?
arch = if node['kernel']['machine'] =~ /armv6l/
         if node['nodejs']['binary']['checksum']['linux_armv6l'] || node['nodejs']['checksum'][node['nodejs']['version']]['linux']['armv6l']['tar.xz'] || node['nodejs']['checksum'][node['nodejs']['version']]['linux']['armv6l']['tar.gz']
           node['kernel']['machine']
         else
           'arm-pi' # assume a raspberry pi as NodeJs don't have a package for it in this version
         end
       elsif node['kernel']['machine'] =~ /aarch64/
         'arm64'
       elsif node['kernel']['machine'] =~ /x86_64/
         'x64'
       elsif node['kernel']['machine'] =~ /\d86/
         'x86'
       else
         node['kernel']['machine']
       end

# needed to uncompress the binary
package 'tar' if platform_family?('rhel', 'fedora', 'amazon', 'suse')

# package_stub is for example: "node-v6.9.1-linux-x64.tar.gz"
version = "v#{node['nodejs']['version']}/"
prefix = node['nodejs']['prefix_url']['node']

# Choose short platform name and file extension based on our platform family
# Used to build the URL
case node['platform_family']
when 'windows'
  platform = 'win'
  extension = '7z'
when 'mac_os_x'
  platform = 'darwin'
  extension = 'tar.xz'
when 'aix'
  platform = 'aix'
  extension = 'tar.gz'
when 'smartos', 'omnios', 'openindiana', 'opensolaris', 'solaris2', 'nexentacore'
  platform = 'sunos'
  extension = 'tar.xz'
else
  platform = 'linux'
  extension = 'tar.gz'
end

if node['nodejs']['engine'] == 'iojs'
  filename = "iojs-v#{node['nodejs']['version']}-#{platform}-#{arch}.#{extension}"
  archive_name = 'iojs-binary'
  binaries = ['bin/iojs', 'bin/node']
else
  filename = "node-v#{node['nodejs']['version']}-#{platform}-#{arch}.#{extension}"
  archive_name = 'nodejs-binary'
  binaries = ['bin/node']
end

binaries.push('bin/npm') if node['nodejs']['npm']['install_method'] == 'embedded'

if node['nodejs']['binary']['url']
  nodejs_bin_url = node['nodejs']['binary']['url']
  checksum = node['nodejs']['binary']['checksum']
else
  nodejs_bin_url = ::URI.join(prefix, version, filename).to_s
end

checksum = node['nodejs']['binary']['checksum']["#{platform}_#{arch}"] if checksum.nil?
checksum = node['nodejs']['checksum'][node['nodejs']['version']][platform][arch][extension] if checksum.nil?

win_install_dir = node['nodejs']['binary']['win_install_dir']
win_install_dir = "C:\\Program Files(x86)\\#{archive_name}" if win_install_dir.nil? && node['kernel']['machine'] =~ /x86_64/ && "#{platform}_#{arch}" == 'win_x86'
win_install_dir = "C:\\Program Files\\#{archive_name}" if win_install_dir.nil?

ark archive_name do
  url nodejs_bin_url
  version node['nodejs']['version']
  checksum checksum
  has_binaries binaries
  append_env_path true
  win_install_dir win_install_dir
  action :install
end
