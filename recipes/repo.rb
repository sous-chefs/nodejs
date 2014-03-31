case node['platform_family']
when 'debian'
  include_recipe 'apt'

  apt_repository 'node.js' do
    uri node['nodejs']['repo']
    distribution node['lsb']['codename']
    components ['main']
    keyserver 'keyserver.ubuntu.com'
    key 'C7917B12'
  end
when 'rhel'
  include_recipe 'yum-epel'
end
