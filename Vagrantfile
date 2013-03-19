# Automatically install and mount cookbooks from Berksfile

require 'kitchen/vagrant'
require 'berkshelf/vagrant'

Vagrant::Config.run do |config|
  Kitchen::Vagrant.define_vms(config)
end
