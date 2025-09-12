case node['platform_family']
when 'debian'
  # Install necessary packages for downloading and verifying new repository information
  package %w(ca-certificates curl gnupg apt-transport-https)

  # Create a directory for the new repository's keyring, if it doesn't exist
  directory '/etc/apt/keyrings'

  # Download the new repository's GPG key and save it in the keyring directory
  execute 'add nodejs gpg key' do
    command "curl -fsSL #{node['nodejs']['key']} | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg"
    not_if { ::File.exist? '/etc/apt/keyrings/nodesource.gpg' }
  end

  # Prefer nodesource over Ubuntu universe packages by giving a higher priority (default 500)
  apt_preference 'nodesource' do
    glob '*'
    pin 'origin deb.nodesource.com'
    pin_priority '600'
  end

  if Gem::Version.new('18.3.0') <= Chef::VERSION
    apt_repository 'nodesource' do
      uri node['nodejs']['repo']
      components ['main']
      options ['signed-by=/etc/apt/keyrings/nodesource.gpg']
      distribution node['nodejs']['distribution']
    end
  else
    # Chef Infra < 18.3 doesn't support options attribute, fallback to (deprecated) apt-key method
    apt_repository 'nodesource' do
      uri node['nodejs']['repo']
      components ['main']
      key '2F59B5F99B1BE0B4'
      keyserver 'keyserver.ubuntu.com'
      distribution node['nodejs']['distribution']
    end
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
