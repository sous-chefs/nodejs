apt_update 'update'

node.default['nodejs']['install_method'] = 'source'
include_recipe 'nodejs::default'
