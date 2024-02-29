case node['platform_family']
when 'debian'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://deb.nodesource.com/node_18.x'
  default['nodejs']['keyserver']    = 'keyserver.ubuntu.com'
  default['nodejs']['distribution'] = 'nodistro'
  default['nodejs']['key']          = '2F59B5F99B1BE0B4'
when 'rhel', 'amazon'
  default['nodejs']['install_repo'] = true
  release_ver = platform?('amazon') ? 7 : node['platform_version'].to_i
  default['nodejs']['repo']         = "https://rpm.nodesource.com/pub_17.x/el/#{release_ver}/$basearch"
  default['nodejs']['key']          = 'https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL'
when 'fedora'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://rpm.nodesource.com/pub_17.x/el/9/$basearch'
  default['nodejs']['key']          = 'https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL'
end
