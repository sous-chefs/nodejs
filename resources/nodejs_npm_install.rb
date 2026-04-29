# frozen_string_literal: true

provides :nodejs_npm_install
unified_mode true

use '_partial/_nodejs'

property :install_method, String, equal_to: %w(embedded source), default: 'embedded'
property :install_node, [true, false], default: true
property :node_install_method, String, equal_to: %w(package binary source chocolatey), default: 'package'
property :npm_version, String, default: 'latest'
property :npm_url, [String, nil]
property :npm_checksum, [String, nil]
property :make_threads, [Integer, String, nil], default: nil

default_action :install

action :install do
  nodejs_install 'nodejs for npm' do
    install_method new_resource.node_install_method
    version new_resource.version
    prefix_url new_resource.prefix_url
    action :install
    only_if { new_resource.install_node }
  end

  ark 'npm' do
    url lazy { npm_dist(new_resource.npm_version, new_resource.npm_url)['url'] }
    checksum new_resource.npm_checksum if new_resource.npm_checksum
    version lazy { npm_dist(new_resource.npm_version, new_resource.npm_url)['version'] || new_resource.npm_version }
    make_opts ["-j #{new_resource.make_threads || default_make_threads}"]
    action :install_with_make
    only_if { new_resource.install_method == 'source' }
  end
end

action :remove do
  ark 'npm' do
    action :remove
    only_if { new_resource.install_method == 'source' }
  end
end

action_class do
  include NodeJs::Helper
end
