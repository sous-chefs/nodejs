include_attribute 'nodejs::default'
include_attribute 'nodejs::repo'

default['nodejs']['packages'] = value_for_platform_family(
  'debian' => node['nodejs']['install_repo'] ? ['nodejs'] : %w(nodejs npm nodejs-dev),
  %w(rhel fedora amazon) => node['nodejs']['install_repo'] ? %w(nodejs nodejs-devel) : %w(nodejs npm nodejs-dev),
  'suse' => node['platform_version'].to_i < 42 ? %w(nodejs10 npm10 nodejs10-devel) : %w(nodejs4 npm4 nodejs4-devel),
  'mac_os_x' => ['node'],
  'freebsd' => %w(node npm),
  'default' => ['nodejs']
)

# Add options and actions by package name
default['nodejs']['package_action'] = { default: :install }
default['nodejs']['package_options'] = { default: '' }
# Disable upstream DNF module on EL8 based systems
default['nodejs']['dnf_module'] = false
