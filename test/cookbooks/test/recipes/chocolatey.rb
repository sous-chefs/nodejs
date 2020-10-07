node.default['nodejs']['install_method'] = 'chocolatey'
include_recipe 'nodejs::default'
include_recipe 'test::resource_win'
