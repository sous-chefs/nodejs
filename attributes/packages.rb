case node['platform_family']
when 'debian'
  default['nodejs']['repo'] = 'http://ppa.launchpad.net/chris-lea/node.js/ubuntu'
  default['nodejs']['packages'] = node['nodejs']['install_repo'] ? 'nodejs' : %w(nodejs npm nodejs-dev)
when 'rhel', 'fedora'
  default['nodejs']['packages'] = %w(nodejs nodejs-devel npm)
when 'smartos'
  default['nodejs']['packages'] = 'nodejs'
when 'mac_os_x'
  default['nodejs']['packages'] = 'node'
else
  Chef::Log.info 'There are no nodejs packages for this platform; please use the source or binary method to install node'
end
