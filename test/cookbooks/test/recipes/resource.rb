# frozen_string_literal: true

apt_update 'update' if platform_family?('debian')
include_recipe 'git'

nodejs_npm_install 'embedded npm' do
  install_method 'embedded'
  install_node false
end

user 'random' do
  manage_home true
  home '/home/random'
end

user 'random1' do
  manage_home true
  home '/home/random1'
end

user 'random2' do
  manage_home true
  home '/home/random2'
end

# global "express" using the old resource alias
nodejs_npm 'express' do
  auto_update false
end

npm_package 'async' do
  version '0.6.2'
  auto_update false
end

npm_package 'xss' do
  version '1.0.7'
  auto_update false
end

npm_package 'xss noupgrade' do
  package 'xss'
  auto_update false
end

npm_package 'minify' do
  version '5.2.0'
  auto_update false
end

npm_package 'minify upgrade' do
  package 'minify'
  live_stream true
  auto_update false
end

npm_package 'request' do
  url 'github mikeal/request'
  live_stream true
  auto_update false
end

npm_package 'mocha' do
  options ['--force', '--production']
  auto_update false
end

git '/home/random2/grunt' do
  repository 'https://github.com/gruntjs/grunt'
  user 'random2'
end

directory '/home/random2/.npm' do
  owner 'random2'
end

npm_package 'Install the grunt package' do
  path '/home/random2'
  package 'grunt'
  json '/home/random2/grunt'
  user 'random2'
  auto_update false
end

npm_package 'Install the vary package from a tgz url' do
  path '/home/random2'
  package 'vary'
  json 'https://registry.npmjs.org/vary/-/vary-1.1.2.tgz'
  user 'random2'
  auto_update false
end

directory '/home/random/.npm' do
  owner 'random'
end

# Create a package.json file for the test user
template '/home/random/package.json' do
  source 'package.json'
  owner 'random'
  user 'random'
end

# Create an .npmrc file for the test user
file '/home/random/.npmrc' do
  content '//registry.npmjs.org/:_authToken=${NPM_TOKEN}'
  owner 'random'
  user 'random'
end

# Test npm_token usage (for NPM private repositories)
npm_package 'from_package_json' do
  path '/home/random'
  json true
  user 'random'
  npm_token '123-abcde'
  node_env 'staging' # Test node_env usage
  auto_update false
end

directory '/home/random1/.npm' do
  owner 'random1'
end

# Create an .npmrc file for the test user
file '/home/random1/.npmrc' do
  content '//registry.npmjs.org/:_authToken=${NPM_TOKEN}'
  owner 'random1'
  user 'random1'
end

# Create a package.json file for the test user
template '/home/random1/package.json' do
  source 'package.json'
  owner 'random1'
  user 'random1'
end

# Test npm_token usage (for NPM private repositories)
npm_package 'from_package_json_private' do
  path '/home/random1'
  json true
  npm_token '123-abcde'
  options ['--development']
  node_env 'development'
  auto_update false
end
