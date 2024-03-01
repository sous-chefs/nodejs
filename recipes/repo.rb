case node['platform_family']
when 'debian'
  directory '/etc/apt/keyrings'

  execute 'add nodejs gpg key' do
    command "curl -fsSL #{node['nodejs']['key']} | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg"
    not_if { ::File.exist? '/etc/apt/keyrings/nodesource.gpg' }
  end

  package 'nodejs-apt-transport-https' do
    package_name 'apt-transport-https'
  end

  apt_repository 'nodesource' do
    uri node['nodejs']['repo']
    components ['main']
    distribution node['nodejs']['distribution']
    options ['signed-by=/etc/apt/keyrings/nodesource.gpg']
  end
when 'rhel', 'fedora', 'amazon'
  yum_repository 'nodesource-nodejs' do
    description 'nodesource.com nodejs repository'
    baseurl node['nodejs']['repo']
    gpgkey node['nodejs']['key']
    priority '9'
    options(module_hotfixes: 1)
  end
end
