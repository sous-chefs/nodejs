# frozen_string_literal: true

require 'shellwords'

provides :npm_package
unified_mode true

provides :nodejs_npm

property :package, String, name_property: true
property :version, String
property :path, String
property :url, String
property :json, [String, true, false]
property :npm_token, String, sensitive: true
property :options, Array, default: []
property :user, String
property :group, String
property :live_stream, [false, true], default: false
property :node_env, String
property :auto_update, [true, false], default: true

default_action :install

action :install do
  execute "install NPM package #{new_resource.package}" do
    cwd new_resource.path
    command Shellwords.join(['npm', 'install', *npm_options])
    user new_resource.user
    group new_resource.group
    environment npm_env_vars
    live_stream new_resource.live_stream
    sensitive true if new_resource.npm_token
    not_if { no_auto_update? && package_installed? }
  end
end

action :uninstall do
  execute "uninstall NPM package #{new_resource.package}" do
    cwd new_resource.path
    command Shellwords.join(['npm', 'uninstall', *npm_options])
    user new_resource.user
    group new_resource.group
    environment npm_env_vars
    live_stream new_resource.live_stream
    sensitive true if new_resource.npm_token
    only_if { package_installed? }
  end
end

action :remove do
  execute "uninstall NPM package #{new_resource.package}" do
    cwd new_resource.path
    command Shellwords.join(['npm', 'uninstall', *npm_options])
    user new_resource.user
    group new_resource.group
    environment npm_env_vars
    live_stream new_resource.live_stream
    sensitive true if new_resource.npm_token
    only_if { package_installed? }
  end
end

action_class do
  include NodeJs::Helper

  def npm_env_vars
    env_vars = {}
    env_vars['HOME'] = ::Dir.home(new_resource.user) if new_resource.user
    env_vars['USER'] = new_resource.user if new_resource.user
    env_vars['NPM_TOKEN'] = new_resource.npm_token if new_resource.npm_token
    env_vars['NODE_ENV'] = new_resource.node_env if new_resource.node_env

    env_vars
  end

  def package_installed?
    return package_json_installed? if new_resource.json == true

    new_resource.package && npm_package_installed?(new_resource.package, new_resource.version, new_resource.path, npm_env_vars)
  end

  def package_json_installed?
    new_resource.path && ::File.exist?(::File.join(new_resource.path, 'node_modules'))
  end

  def no_auto_update?
    new_resource.package && !new_resource.auto_update
  end

  def npm_options
    options = []
    options << '-global' unless new_resource.path
    options.concat(new_resource.options)
    options << npm_package if npm_package
    options
  end

  def npm_package
    if new_resource.json
      new_resource.json.is_a?(String) ? new_resource.json : nil
    elsif new_resource.url
      new_resource.url
    elsif new_resource.package
      new_resource.version ? "#{new_resource.package}@#{new_resource.version}" : new_resource.package
    else
      Chef::Log.error("No good options found to install #{new_resource.package}")
    end
  end
end
