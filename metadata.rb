name 'nodejs'
maintainer 'redguide'
maintainer_email 'guilhem@lettron.fr'
license 'Apache 2.0'
description 'Installs/Configures node.js & io.js'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '2.4.1'

conflicts 'node'

depends 'yum-epel'
depends 'build-essential'
depends 'ark'
depends 'apt'
depends 'homebrew'

%w(debian ubuntu centos redhat smartos mac_os_x).each do |os|
  supports os
end

suggests 'application_nodejs'
