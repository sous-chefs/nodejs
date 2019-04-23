# ~FC121
name 'nodejs'
maintainer 'redguide'
maintainer_email 'guilhem@lettron.fr'
license 'Apache-2.0'
description 'Installs/Configures node.js'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/redguide/nodejs'
issues_url 'https://github.com/redguide/nodejs/issues'
chef_version '>= 12.14' if respond_to?(:chef_version)
version '6.1.0'

depends 'build-essential', '>= 5.0'
depends 'ark', '>= 2.0.2'

%w(debian ubuntu centos redhat scientific oracle amazon smartos mac_os_x opensuseleap suse windows).each do |os|
  supports os
end
