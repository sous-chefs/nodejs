case node['platform_family']
when 'debian'
apt_package 'curl'
		execute 'nodejs_ppa_install' do
		command 'curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -'
		end
#  include_recipe 'apt'
#
#  apt_repository 'node.js' do
#    uri node['nodejs']['repo']
#    distribution node['lsb']['codename']
#    components ['main']
#    keyserver node['nodejs']['keyserver']
#    key node['nodejs']['key']
#  end
when 'rhel'
  #include_recipe 'yum-epel'
	yum_package 'curl'
	execute 'nodejs_repo_install' do
	command 'curl -sL https://rpm.nodesource.com/setup_6.x | bash - '
end


#apt_repository 'nginx-php' do
#  uri          'ppa:nginx/stable'
#  distribution node['lsb']['codename']

end