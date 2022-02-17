node.default['yum']['centos-sclo']['enabled'] = true
node.default['yum']['centos-sclo']['managed'] = true
node.default['yum']['centos-sclo-rh']['enabled'] = true
node.default['yum']['centos-sclo-rh']['managed'] = true
include_recipe 'yum-centos'
