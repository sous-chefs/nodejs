# frozen_string_literal: true

require 'spec_helper'

describe 'nodejs_repository' do
  step_into :nodejs_repository

  context 'on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      nodejs_repository 'nodesource'
    end

    it { is_expected.to install_package(%w(ca-certificates curl gnupg apt-transport-https)) }
    it { is_expected.to create_directory('/etc/apt/keyrings') }
    it { is_expected.to create_remote_file('/etc/apt/keyrings/nodesource.asc') }
    it { is_expected.to add_apt_preference('nodesource') }
    it { is_expected.to add_apt_repository('nodesource').with(uri: 'https://deb.nodesource.com/node_24.x', distribution: 'nodistro') }
  end

  context 'on rocky linux' do
    platform 'rocky', '9'

    recipe do
      nodejs_repository 'nodesource'
    end

    it { is_expected.to create_yum_repository('nodesource-nodejs').with(baseurl: 'https://rpm.nodesource.com/pub_24.x/nodistro/nodejs/$basearch') }
  end

  context 'remove on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      nodejs_repository 'nodesource' do
        action :remove
      end
    end

    it { is_expected.to remove_apt_repository('nodesource') }
    it { is_expected.to delete_file('/etc/apt/keyrings/nodesource.asc') }
  end
end
