#
# Author:: Ashok Manji (ashokmanji@hotmail.com)
# Cookbook Name:: nodejs
# Attributes:: windows
#

arch     = node['kernel']['machine'] =~ /x86_64/ ? 'x64' : 'x86'
version  = "v#{node['nodejs']['version']}/"
prefix   = node['nodejs']['prefix_url'][node['nodejs']['engine']]
filename = "node-v#{node['nodejs']['version']}-windows-#{arch}.msi"

default['nodejs']['binary']['url']                     = ::URI.join(prefix, version, filename).to_s
default['nodejs']['binary']['checksum']['windows_x86'] = 'f2414a5f82ddecee5f9ca9fe63ceb8047d740479af797c9db98679d30a8e51f8'
