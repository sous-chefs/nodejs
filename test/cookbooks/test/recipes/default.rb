# frozen_string_literal: true

apt_update 'update' if platform_family?('debian')

nodejs_install 'nodejs' do
  install_method platform_family?('windows') ? 'chocolatey' : 'package'
end

nodejs_npm_install 'embedded npm' do
  install_method 'embedded'
  install_node false
end

nodejs_npm_packages 'default npm packages' do
  packages [
    { name: 'socket.io', version: '4.8.1', auto_update: false },
    { name: 'express', action: :remove },
  ]
end
