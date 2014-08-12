#
# Author:: Paul Bonaud (paul@bonaud.fr)
# Cookbook Name:: nodejs
# Recipe:: packages
#
# This recipe gives you the ability to install node packages
# via chef configuration
#

if node['nodejs'].has_key?('node_packages')
  node['nodejs']['node_packages'].each do |node_pkg|
    nodejs_npm node_pkg['name'] do
      version node_pkg['version'] if node_pkg.has_key?('version')
    end if node_pkg.has_key?('name')
  end
end
