apt_update 'update'

node.default['nodejs']['engine'] = 'iojs'
node.default['nodejs']['install_method'] = 'source'
node.default['nodejs']['source']['checksum'] = '55e79cc4f4cde41f03c1e204d2af5ee4b6e4edcf14defc82e518436e939195fa'
node.default['nodejs']['version'] = '2.2.1'

include_recipe 'nodejs::default'
