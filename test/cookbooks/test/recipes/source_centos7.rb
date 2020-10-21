node.default['yum']['centos-sclo']['enabled'] = true
node.default['yum']['centos-sclo']['managed'] = true
node.default['yum']['centos-sclo-rh']['enabled'] = true
node.default['yum']['centos-sclo-rh']['managed'] = true
include_recipe 'yum-centos'

yum_package 'devtoolset-7-gcc-c++'

ENV['PATH'] = '/opt/rh/devtoolset-7/root/usr/bin:' + ENV['PATH']
ENV['CC'] = '/opt/rh/devtoolset-7/root/usr/bin/gcc'
ENV['CXX'] = '/opt/rh/devtoolset-7/root/usr/bin/g++'
