# frozen_string_literal: true

require 'spec_helper'

describe 'nodejs_npm_packages' do
  step_into :nodejs_npm_packages
  platform 'ubuntu', '24.04'

  recipe do
    nodejs_npm_packages 'packages' do
      packages [
        { name: 'express' },
        { name: 'socket.io', version: '4.8.1' },
        { name: 'left-pad', action: :remove },
      ]
    end
  end

  it { is_expected.to install_npm_package('nodejs_npm-express-install').with(package: 'express') }
  it { is_expected.to install_npm_package('nodejs_npm-socket.io-install').with(package: 'socket.io', version: '4.8.1') }
  it { is_expected.to remove_npm_package('nodejs_npm-left-pad-remove').with(package: 'left-pad') }
end
