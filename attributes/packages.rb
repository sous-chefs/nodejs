include_attribute 'nodejs::default'
include_attribute 'nodejs::repo'

case node['nodejs']['engine']
when 'node'
  default['nodejs']['packages'] = value_for_platform_family(
    'debian' => node['nodejs']['install_repo'] ? ['nodejs'] : ['nodejs', 'npm', 'nodejs-dev'],
    %w(rhel fedora) => ['nodejs', 'nodejs-devel', 'npm'],
    'suse' => node['platform_version'].to_i < 42 ? ['nodejs', 'nodejs-devel'] : ['nodejs', 'npm', 'nodejs-devel'],
    'mac_os_x' => ['node'],
    'freebsd' => %w(node npm),
    'default' => ['nodejs']
  )
when 'iojs'
  default['nodejs']['packages'] = ['iojs']
end
