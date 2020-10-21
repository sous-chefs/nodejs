apt_update 'update'

# Source install puts the npm symlink in /usr/local/bin
ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']

if platform_family?('rhel') && node['platform_version'].to_i == 7
  include_recipe 'test::source_centos7'
end

node.default['nodejs']['install_method'] = 'source'
include_recipe 'nodejs::default'
include_recipe 'test::resource'
