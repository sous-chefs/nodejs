apt_update 'update'

node.default['nodejs']['install_method'] = 'chocolatey'
include_recipe 'nodejs::default'
include_recipe 'test::resource'
