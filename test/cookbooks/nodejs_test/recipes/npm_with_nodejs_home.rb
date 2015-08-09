# Tests nodejs_home attribute

include_recipe 'git'

nodejs_npm 'appium' do
  nodejs_home "/tmp/node-#{node['nodejs']['install_method']}"
  options ['--unsafe-perm']
end
