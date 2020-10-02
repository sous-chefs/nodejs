apt_update 'update'

node.default['nodejs']['install_method'] = 'package'

include_recipe 'nodejs::default'
