name 'nodejs'
maintainer 'redguide'
maintainer_email 'guilhem@lettron.fr'
license 'Apache 2.0'
description 'Installs/Configures node.js & io.js'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/redguide/nodejs'
issues_url 'https://github.com/redguide/nodejs/issues'
chef_version '>= 12.1' if respond_to?(:chef_version)
version '3.0.1'

depends 'yum-epel'
depends 'build-essential'
depends 'ark'
depends 'compat_resource', '>= 12.14.7'

%w(debian ubuntu centos redhat scientific oracle amazon smartos mac_os_x).each do |os|
  supports os
end
