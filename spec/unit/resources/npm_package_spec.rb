# frozen_string_literal: true

require 'spec_helper'

describe 'npm_package' do
  step_into :npm_package, :nodejs_npm
  platform 'ubuntu', '24.04'

  context 'install a global package' do
    recipe do
      npm_package 'express'
    end

    it { is_expected.to run_execute('install NPM package express').with(command: 'npm install -global express') }
  end

  context 'install a versioned package' do
    recipe do
      npm_package 'async' do
        version '0.6.2'
        options ['--production']
      end
    end

    it { is_expected.to run_execute('install NPM package async').with(command: 'npm install -global --production async@0.6.2') }
  end

  context 'install with the legacy alias' do
    recipe do
      nodejs_npm 'mocha'
    end

    it { is_expected.to run_execute('install NPM package mocha').with(command: 'npm install -global mocha') }
  end
end
