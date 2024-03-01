case node['platform_family']
when 'debian'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://deb.nodesource.com/node_18.x'
  default['nodejs']['distribution'] = 'nodistro'
  default['nodejs']['key']          = 'https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key'
when 'amazon', 'rhel', 'fedora'
  default['nodejs']['install_repo'] = true
  node_version = platform?('amazon') ? '17.x' : '18.x'
  default['nodejs']['repo']         = "https://rpm.nodesource.com/pub_#{node_version}/nodistro/nodejs/$basearch"
  default['nodejs']['key']          = 'https://rpm.nodesource.com/gpgkey/ns-operations-public.key'
end
