name 'nodejs'
maintainer 'redguide'
maintainer_email 'guilhem@lettron.fr'
license 'Apache-2.0'
description 'Installs/Configures node.js'
source_url 'https://github.com/redguide/nodejs'
issues_url 'https://github.com/redguide/nodejs/issues'
chef_version '>= 14'
version '7.2.0'

depends 'ark', '>= 2.0.2'
depends 'chocolatey', '>= 3.0'

%w(debian ubuntu centos redhat scientific oracle amazon smartos mac_os_x opensuseleap suse windows).each do |os|
  supports os
end
