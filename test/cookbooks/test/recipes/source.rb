apt_update 'update'

# Source install puts the npm symlink in /usr/local/bin
ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']

node.default['nodejs']['install_method'] = 'source'
include_recipe 'nodejs::default'
include_recipe 'test::resource'
