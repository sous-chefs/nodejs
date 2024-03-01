case node['platform_family']
when 'debian'
  # Install necessary packages for downloading and verifying new repository information
  package %w(ca-certificates curl gnupg)
  # Create a directory for the new repository's keyring, if it doesn't exist
  directory '/etc/apt/keyrings'
  # Download the new repository's GPG key and save it in the keyring directory
  execute 'add nodejs gpg key' do
    command "curl -fsSL #{node['nodejs']['key']} | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg"
    not_if { ::File.exist? '/etc/apt/keyrings/nodesource.gpg' }
  end

  package 'nodejs-apt-transport-https' do
    package_name 'apt-transport-https'
  end

  repo = apt_repository 'nodesource' do
    uri node['nodejs']['repo']
    components ['main']
    distribution node['nodejs']['distribution']
  end
  if Chef::VERSION >= Gem::Version.new('18.3.0')
    repo.options = ['signed-by=/etc/apt/keyrings/nodesource.gpg']
  else
    repo.key = '2F59B5F99B1BE0B4'
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
