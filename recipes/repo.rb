case node['platform_family']
when 'debian'
  include_recipe 'apt'

  apt_repository 'node.js' do
    uri node['nodejs']['repo']
    distribution node['lsb']['codename']
    components ['main']
    keyserver node['nodejs']['keyserver']
    key node['nodejs']['key']
  end
when 'rhel'
  if platform? 'amazon'
    script_name = "setup_#{node['nodejs']['version'].to_i}.x"

    remote_file "#{Chef::Config['file_cache_path']}/#{script_name}" do
      source "https://rpm.nodesource.com/#{script_name}"
      mode '0755'
    end

    execute "#{Chef::Config['file_cache_path']}/#{script_name}"
  else
    include_recipe 'yum-epel'
  end
end
