case node['platform_family']
when 'debian'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://deb.nodesource.com/node_20.x'
  default['nodejs']['distribution'] = 'nodistro'
  default['nodejs']['key']          = 'https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key'
when 'rhel', 'amazon', 'fedora'
  default['nodejs']['install_repo'] = true
  node_version = platform?('amazon') ? '17.x' : '20.x'
  default['nodejs']['repo']         = "https://rpm.nodesource.com/pub_#{node_version}/nodistro/nodejs/$basearch"
  default['nodejs']['key']          = 'https://rpm.nodesource.com/gpgkey/ns-operations-public.key'
end
