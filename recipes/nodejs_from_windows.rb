#
# Author:: Ashok Manji (ashokmanji@hotmail.com)
# Cookbook Name:: nodejs
# Recipe:: windows
#

arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'

version  = "v#{node['nodejs']['version']}/"
prefix   = node['nodejs']['prefix_url'][node['nodejs']['engine']]
filename = "node-v#{node['nodejs']['version']}-#{arch}.msi"

if node['nodejs']['binary']['url']
  nodejs_bin_url = node['nodejs']['binary']['url']
  checksum = node['nodejs']['binary']['checksum']
else
  nodejs_bin_url = ::URI.join(prefix, version, filename).to_s
  checksum = node['nodejs']['binary']['checksum']["windows_#{arch}"]
end

windows_package 'Nodejs' do
  source nodejs_bin_url
  checksum checksum
  action :install
end
