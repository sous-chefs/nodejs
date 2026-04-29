# frozen_string_literal: true

control 'nodejs-source-01' do
  impact 1.0
  title 'Node.js source install is available'

  describe command('node -v') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/^v24\./) }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npx -v') do
    its('exit_status') { should eq 0 }
  end

  describe file('/usr/local/bin/npm') do
    it { should exist }
  end

  describe file('/usr/local/bin/npx') do
    it { should exist }
  end
end
