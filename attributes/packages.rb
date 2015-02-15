include_attribute 'nodejs::default'

case node['nodejs']['engine']
when 'node'
  case node['platform_family']
  when 'debian'
    default['nodejs']['repo']      = 'https://deb.nodesource.com/node'
    default['nodejs']['keyserver'] = 'keyserver.ubuntu.com'
    default['nodejs']['key']       = '1655a0ab68576280'
    default['nodejs']['packages']  = node['nodejs']['install_repo'] ? %w(nodejs) : %w(nodejs npm nodejs-dev)
  when 'rhel', 'fedora'
    default['nodejs']['packages'] = %w(nodejs nodejs-devel npm)
  when 'smartos'
    default['nodejs']['packages'] = %w(nodejs)
  when 'mac_os_x'
    default['nodejs']['packages'] = %w(node)
  end
when 'iojs'
  default['nodejs']['packages'] = nil
end
