# frozen_string_literal: true

require 'spec_helper'

describe 'npm_package' do
  step_into :npm_package, :nodejs_npm
  platform 'ubuntu', '24.04'

  context 'install a global package' do
    recipe do
      npm_package 'express'
    end

    it { is_expected.to run_execute('install NPM package express').with(command: ['npm', 'install', '-global', 'express']) }
  end

  context 'install a versioned package' do
    recipe do
      npm_package 'async' do
        version '0.6.2'
        options ['--production', '--fetch-retries', 3]
      end
    end

    it { is_expected.to run_execute('install NPM package async').with(command: ['npm', 'install', '-global', '--production', '--fetch-retries', '3', 'async@0.6.2']) }
  end

  context 'install with the legacy alias' do
    recipe do
      nodejs_npm 'mocha'
    end

    it { is_expected.to run_execute('install NPM package mocha').with(command: ['npm', 'install', '-global', 'mocha']) }
  end

  context 'install from a legacy GitHub source' do
    recipe do
      npm_package 'request' do
        url 'github mikeal/request'
      end
    end

    it { is_expected.to run_execute('install NPM package request').with(command: ['npm', 'install', '-global', 'github:mikeal/request']) }
  end

  context 'install from a Windows path containing spaces' do
    platform 'windows', '2022'

    recipe do
      npm_package 'request' do
        url 'C:\Package Cache\request.tgz'
      end
    end

    it { is_expected.to run_execute('install NPM package request').with(command: ['npm', 'install', '-global', 'C:\Package Cache\request.tgz']) }
  end
end
