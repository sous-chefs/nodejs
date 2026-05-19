# frozen_string_literal: true

nodejs_npm_install 'source npm' do
  install_method 'source'
  node_install_method 'source'
end
