apt_update 'update'

node.default['nodejs']['install_method'] = 'binary'
include_recipe 'nodejs::default'
