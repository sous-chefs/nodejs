# Grab Node.JS Major Version
node_major = node['nodejs']['version'].to_i

case node['platform_family']
when 'debian'
  default['nodejs']['install_repo'] = true
  default['nodejs']['repo']         = "https://deb.nodesource.com/node_#{node_major}.x"
  default['nodejs']['keyserver']    = 'keyserver.ubuntu.com'
  default['nodejs']['key']          = '1655a0ab68576280'
when 'rhel', 'amazon'
  default['nodejs']['install_repo'] = true
  release_ver = platform?('amazon') ? 6 : node['platform_version'].to_i

  default['nodejs']['repo']         = "https://rpm.nodesource.com/pub_#{node_major}.x/el/#{release_ver}/$basearch"
  default['nodejs']['key']          = 'https://rpm.nodesource.com/pub/el/NODESOURCE-GPG-SIGNING-KEY-EL'
end
