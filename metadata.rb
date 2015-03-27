name 'nodejs'
maintainer 'erulabs'
maintainer_email 'seandon.mooy@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures nodejs and iojs'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '3.0.0'

conflicts 'node'

depends 'ark'

%w(debian ubuntu centos redhat smartos mac_os_x).each do |os|
  supports os
end
