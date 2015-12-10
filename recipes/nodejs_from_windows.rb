#
# Author:: Ashok Manji (ashokmanji@hotmail.com)
# Cookbook Name:: nodejs
# Recipe:: windows
#

arch = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'

windows_package 'Nodejs' do
  source node['nodejs']['binary']['url']
  checksum node['nodejs']['binary']['checksum']["windows_#{arch}"]
  action :install
end
