# frozen_string_literal: true

apt_update 'update' if platform_family?('debian')

# Source install puts the npm symlink in /usr/local/bin
ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']

nodejs_install 'nodejs from source' do
  install_method 'source'
end

include_recipe 'test::resource'
