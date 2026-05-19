# frozen_string_literal: true

nodejs_install 'nodejs' do
  install_method platform_family?('windows') ? 'chocolatey' : 'package'
end

nodejs_npm_install 'embedded npm' do
  install_method 'embedded'
  install_node false
end
