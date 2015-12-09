include_recipe 'git'

user 'random' do
  supports :manage_home => true
  home '/home/random'
end

# global "express"
nodejs_npm 'express'

nodejs_npm 'async' do
  version '0.6.2'
end

nodejs_npm 'request' do
  url 'github mikeal/request'
end

git '/home/random/grunt' do
  repository 'https://github.com/gruntjs/grunt'
  user 'random'
end

nodejs_npm 'grunt' do
  path '/home/random/grunt'
  json true
  user 'random'
end

nodejs_npm 'mocha' do
  options ['--force', '--production']
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
nodejs_npm 'from_package_json' do
  path '/home/random'
  json true
  npm_token '123-abcde'
  options ['--production']
end
