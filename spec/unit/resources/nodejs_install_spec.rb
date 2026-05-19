# frozen_string_literal: true

require 'spec_helper'

describe 'nodejs_install' do
  step_into :nodejs_install, :nodejs_repository

  context 'package install on ubuntu' do
    platform 'ubuntu', '24.04'

    recipe do
      nodejs_install 'nodejs'
    end

    it { is_expected.to create_nodejs_repository('nodesource') }
    it { is_expected.to install_package('nodejs') }
  end

  context 'package install on rocky linux' do
    platform 'rocky', '9'

    recipe do
      nodejs_install 'nodejs'
    end

    before do
      stubs_for_provider('nodejs_install[nodejs]') do |provider|
        allow(provider).to receive_shell_out('dnf -q module list nodejs', returns: [0, 1])
          .and_return(double(stdout: "nodejs 20 common [d]\n", error!: nil))
      end
    end

    it { is_expected.to disable_dnf_module('nodejs') }
    it { is_expected.to install_package('nodejs') }
    it { is_expected.to install_package('nodejs-devel') }
  end

  context 'package install when the nodejs dnf module is unavailable' do
    platform 'rocky', '9'

    recipe do
      nodejs_install 'nodejs'
    end

    before do
      stubs_for_provider('nodejs_install[nodejs]') do |provider|
        allow(provider).to receive_shell_out('dnf -q module list nodejs', returns: [0, 1])
          .and_return(double(stdout: '', error!: nil))
      end
    end

    it { is_expected.not_to disable_dnf_module('nodejs') }
    it { is_expected.to install_package('nodejs') }
    it { is_expected.to install_package('nodejs-devel') }
  end

  context 'binary install' do
    platform 'ubuntu', '24.04'

    recipe do
      nodejs_install 'nodejs' do
        install_method 'binary'
      end
    end

    it { is_expected.to install_ark('nodejs-binary') }
  end

  context 'source install' do
    platform 'ubuntu', '24.04'

    recipe do
      nodejs_install 'nodejs' do
        install_method 'source'
        make_threads 2
      end
    end

    before do
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?).with('/usr/bin/python').and_return(false)
      allow(::File).to receive(:exist?).with('/usr/local/bin/python').and_return(false)
      allow(::File).to receive(:exist?).with('/usr/bin/python3').and_return(true)
    end

    it { is_expected.to install_build_essential('install build tools') }
    it { is_expected.to install_package('libssl-dev') }
    it { is_expected.to install_package('python3') }
    it { is_expected.to create_link('/usr/local/bin/python') }
    it { is_expected.to install_with_make_ark('nodejs-source') }
  end

  context 'source install on rocky linux' do
    platform 'rocky', '9'

    recipe do
      nodejs_install 'nodejs' do
        install_method 'source'
      end
    end

    before do
      stub_command('command -v dnf').and_return(true)
      stub_command('command -v python3').and_return(false)
      allow(::File).to receive(:exist?).and_call_original
      allow(::File).to receive(:exist?).with('/usr/bin/python').and_return(false)
      allow(::File).to receive(:exist?).with('/usr/local/bin/python').and_return(false)
      allow(::File).to receive(:exist?).with('/usr/bin/python3').and_return(false)
    end

    it { is_expected.to install_package('openssl-devel') }
    it { is_expected.to install_package('tar') }
    it { is_expected.to run_execute('install python3 build package') }
    it { is_expected.not_to install_package('python3') }
  end

  context 'chocolatey install' do
    platform 'windows', '2022'

    recipe do
      nodejs_install 'nodejs' do
        install_method 'chocolatey'
      end
    end

    it { is_expected.to upgrade_chocolatey_package('nodejs-lts') }
  end
end
