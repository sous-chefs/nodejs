apt_update 'update'

include_recipe 'nodejs::npm'
include_recipe 'git'

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

# global "express" using the old resource name
nodejs_npm 'express'

npm_package 'async' do
  version '0.6.2'
end

npm_package 'xss' do
  version '1.0.7'
end

npm_package 'xss noupgrade' do
  package 'xss'
  auto_update false
end

npm_package 'minify' do
  version '5.2.0'
end

npm_package 'minify upgrade' do
  package 'minify'
  live_stream true
end

npm_package 'request' do
  url 'github mikeal/request'
  live_stream true
end

npm_package 'mocha' do
  options ['--force', '--production']
end

git '/home/random2/grunt' do
  repository 'https://github.com/gruntjs/grunt'
  user 'random2'
end

npm_package 'Install the grunt package' do
  path '/home/random2'
  package 'grunt'
  json '/home/random2/grunt'
  user 'random2'
end

npm_package 'Install the vary package from a tgz url' do
  path '/home/random2'
  package 'vary'
  json 'https://registry.npmjs.org/vary/-/vary-1.1.2.tgz'
  user 'random2'
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
end
