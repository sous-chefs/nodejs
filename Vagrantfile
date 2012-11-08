# -*- mode: ruby -*-
# vi: set ft=ruby :
begin
  require 'active_support/core_ext/hash/deep_merge'
rescue LoadError => e
  STDERR.puts '', "[!] ERROR -- Please install ActiveSupport (gem install activesupport)", '-'*80, ''
  raise e
end

# Automatically install and mount cookbooks from Berksfile
#
require 'berkshelf/vagrant'

distributions = {
  'opscode-ubuntu-12.04' => {
    :url      => 'https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04.box',
    :run_list => %w| nodejs::install_from_source nodejs::install_from_package nodejs::npm|,
    :node     => {}
  },

  'opscode-ubuntu-12.04-i386' => {
    :url      => 'https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-12.04-i386.box',
    :run_list => %w| nodejs::install_from_source nodejs::install_from_package nodejs::npm|,
    :node     => {}
  },

  'opscode-ubuntu-10.04' => {
    :url      => 'https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-ubuntu-10.04.box',
    :run_list => %w| nodejs::install_from_source nodejs::install_from_package nodejs::npm|,
    :node     => {}
  },

  'opscode-centos6.3' => {
    :url      => 'https://opscode-vm.s3.amazonaws.com/vagrant/boxes/opscode-centos-6.3.box',
    :run_list => %w| nodejs::install_from_source nodejs::install_from_package nodejs::npm|,
    :node     => {}
  }
}

node_config = {
}

Vagrant::Config.run do |config|

  distributions.each_pair do |name, options|

    config.vm.define name, :options => options[:primary] do |box_config|

      box_config.vm.box       = name.to_s
      box_config.vm.box_url   = options[:url]

      box_config.vm.host_name = name.to_s

      # Install latest Chef on the machine

      box_config.vm.provision :shell do |shell|
        version = ENV['CHEF'].match(/^\d+/) ? ENV['CHEF'] : nil
        shell.inline = %Q{
          test -d "apt-get"   && apt-get update
          test -d "chef-solo" || curl -# -L http://www.opscode.com/chef/install.sh | sudo bash -s -- #{version ? "-v #{version}" : ''}
        }
      end if ENV['CHEF']

      # Provision the machine with Chef Solo
      #
      box_config.vm.provision :chef_solo do |chef|
        chef.cookbooks_path    = ['..', './tmp/cookbooks']
        chef.provisioning_path = '/etc/vagrant-chef'
        chef.log_level         = :debug

        chef.run_list = options[:run_list]
        chef.json     = node_config.deep_merge(options[:node])
      end
    end

  end

end
