include_recipe 'git'

user 'random' do
  manage_home true
  home '/home/random'
end

# global "express" using the old resource name
nodejs_npm 'express'

npm_package 'async' do
  version '0.6.2'
end

npm_package 'request' do
  url 'github mikeal/request'
end

git '/home/random/grunt' do
  repository 'https://github.com/gruntjs/grunt'
  user 'random'
end

npm_package 'Install the grunt package' do
  package 'grunt'
  path '/home/random/grunt'
  json true
  user 'random'
end

npm_package 'mocha' do
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
npm_package 'from_package_json' do
  path '/home/random'
  json true
  npm_token '123-abcde'
  options ['--production']
end
