case node['platform_family']
when 'debian'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = 'https://deb.nodesource.com/node_14.x'
  default['nodejs']['keyserver']    = 'keyserver.ubuntu.com'
  default['nodejs']['key']          = '1655a0ab68576280'
when 'rhel', 'fedora', 'amazon'
  default['nodejs']['install_repo'] = true
  release_ver = platform?('amazon') ? 7 : node['platform_version'].to_i
  default['nodejs']['repo']         = "https://rpm.nodesource.com/pub_14.x/el/#{release_ver}/$basearch"
  default['nodejs']['key']          = 'https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL'
end
