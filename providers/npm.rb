include NodeJs::Helper

use_inline_resources if defined?(use_inline_resources)

action :install do
  execute "install NPM package #{new_resource.name}" do
    cwd path
    command "npm install #{npm_options}"
    not_if { new_resource.package && npm_package_installed?(new_resource.package, new_resource.version, new_resource.path) }
  end
end

action :uninstall do
  execute "uninstall NPM package #{new_resource.package}" do
    cwd path
    command "npm uninstall #{npm_options}"
    only_if { new_resource.package && npm_package_installed?(new_resource.package, new_resource.version, new_resource.path) }
  end
end

def npm_options
  options = ''
  options << ' -global' unless new_resource.path
  options << " #{npm_package}"
end

def npm_package
  if new_resource.json
    return new_resource.json.is_a?(String) ? new_resource.json : nil
  elsif new_resource.url
    return new_resource.url
  elsif new_resource.package
    return new_resource.version ? "#{new_resource.package}@#{new_resource.version}" : new_resource.package
  else
    Chef::Log.error("No good options found to install #{new_resource.name}")
  end
end
