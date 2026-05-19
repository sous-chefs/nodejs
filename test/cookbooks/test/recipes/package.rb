# frozen_string_literal: true

apt_update 'update' if platform_family?('debian')

nodejs_install 'nodejs' do
  install_method 'package'
end

include_recipe 'test::resource'
