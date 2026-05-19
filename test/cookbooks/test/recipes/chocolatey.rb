# frozen_string_literal: true

nodejs_install 'nodejs' do
  install_method 'chocolatey'
end

include_recipe 'test::resource_win'
