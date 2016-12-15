name 'nodejs'
maintainer 'redguide'
maintainer_email 'guilhem@lettron.fr'
license 'Apache 2.0'
description 'Installs/Configures node.js & io.js'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
source_url 'https://github.com/redguide/nodejs' if respond_to?(:source_url)
issues_url 'https://github.com/redguide/nodejs/issues' if respond_to?(:issues_url)
chef_version '>= 11.0' if respond_to?(:chef_version)
version '3.0.0'

depends 'yum-epel'
depends 'build-essential'
depends 'ark'
depends 'apt', '>= 2.9.1'
depends 'homebrew'

%w(debian ubuntu centos redhat scientific oracle amazon smartos mac_os_x).each do |os|
  supports os
end
