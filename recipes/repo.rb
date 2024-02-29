case node['platform_family']
when 'debian'
  execute 'add nodejs gpg key' do
    command 'curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /usr/share/keyrings/nodesource.gpg'
    not_if { ::File.exist? '/usr/share/keyrings/nodesource.gpg' }
  end

  package 'nodejs-apt-transport-https' do
    package_name 'apt-transport-https'
  end

  apt_repository 'node.js' do
    uri node['nodejs']['repo']
    components ['main']
    distribution node['nodejs']['distribution']
    key node['nodejs']['key']
    keyserver node['nodejs']['keyserver']
  end
when 'rhel', 'fedora', 'amazon'
  yum_repository 'node.js' do
    description 'nodesource.com nodejs repository'
    baseurl node['nodejs']['repo']
    gpgkey node['nodejs']['key']
  end
end
