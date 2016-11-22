case node['nodejs']['engine']
when 'node'
  case node['platform_family']
  when 'debian'
    default['nodejs']['install_repo'] = true

    default['nodejs']['repo']      = 'https://deb.nodesource.com/node'
    default['nodejs']['keyserver'] = 'keyserver.ubuntu.com'
    default['nodejs']['key']       = '1655a0ab68576280'
  when 'rhel'
    default['nodejs']['install_repo'] = true
	### Custom repo for 4.6.x nodejs # swapnil #
    #default['nodejs']['repo']      = '=https://rpm.nodesource.com/pub_4.x/el/7/$basearch'
    #default['nodejs']['keyserver'] = 'rpm.nodesource.com/pub/el/'
    ##default['nodejs']['key']       = 'NODESOURCE-GPG-SIGNING-KEY-EL'
    #default['nodejs']['key']       = '0x34FA74DD'
  end
when 'iojs'
  case node['platform_family']
  when 'debian'
    default['nodejs']['install_repo'] = true

    default['nodejs']['repo']      = 'https://deb.nodesource.com/iojs_2.x'
    default['nodejs']['keyserver'] = 'keyserver.ubuntu.com'
    default['nodejs']['key']       = '1655a0ab68576280'
  end
end
