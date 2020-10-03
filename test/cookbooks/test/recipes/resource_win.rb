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

npm_package 'mocha' do
  options ['--force', '--production']
end
