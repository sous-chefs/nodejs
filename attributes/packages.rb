include_attribute 'nodejs::default'

case node['platform_family']
when 'debian'
  default['nodejs']['repo'] = 'http://ppa.launchpad.net/chris-lea/node.js/ubuntu'
  default['nodejs']['packages'] = node['nodejs']['install_repo'] ? %w(nodejs) : %w(nodejs npm nodejs-dev)
when 'rhel', 'fedora'
  default['nodejs']['packages'] = %w(nodejs nodejs-devel npm)
when 'smartos'
  default['nodejs']['packages'] = %w(nodejs)
else
  Chef::Log.error 'There are no nodejs packages for this platform; please use the source or binary method to install node'
  return
end
