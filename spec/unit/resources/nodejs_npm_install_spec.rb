# frozen_string_literal: true

require 'spec_helper'

describe 'nodejs_npm_install' do
  step_into :nodejs_npm_install
  platform 'ubuntu', '24.04'

  context 'embedded npm' do
    recipe do
      nodejs_npm_install 'npm'
    end

    it { is_expected.to install_nodejs_install('nodejs for npm') }
    it { is_expected.to_not install_with_make_ark('npm') }
  end

  context 'source npm' do
    recipe do
      nodejs_npm_install 'npm' do
        install_method 'source'
        npm_url 'https://registry.npmjs.org/npm/-/npm-11.0.0.tgz'
        npm_version '11.0.0'
        npm_checksum 'a4f653d79ed140aaad921e8c22a3b585ca85cfdab80d4030f6309e4663a8a1c8'
      end
    end

    it { is_expected.to install_nodejs_install('nodejs for npm') }
    it { is_expected.to install_with_make_ark('npm') }
  end
end
