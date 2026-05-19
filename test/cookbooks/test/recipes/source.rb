# frozen_string_literal: true

apt_update 'update' if platform_family?('debian')

# Source install puts the npm symlink in /usr/local/bin
ENV['PATH'] = '/usr/local/bin:' + ENV['PATH']

nodejs_install 'nodejs from source' do
  install_method 'source'
  version '20.20.2'
  source_checksum '8cb85a81f75169eb811f7b2512cf17a646826430debbe016a7461f31e286fdef'
end

include_recipe 'test::resource'
