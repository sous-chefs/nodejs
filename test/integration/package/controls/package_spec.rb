# frozen_string_literal: true

control 'nodejs-package-01' do
  impact 1.0
  title 'Node.js package install is available'

  describe command('node -v') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match(/^v24\./) }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
  end
end

control 'nodejs-package-02' do
  impact 0.7
  title 'npm_package resources install expected packages'

  describe command('npm list -json -global') do
    its('stdout') { should match(/express/) }
    its('stdout') { should match(/"async": {\n\s*"version": "0.6.2"/) }
    its('stdout') { should match(/request/) }
    its('stdout') { should match(/mocha/) }
  end

  describe command('npm list xss -json -global') do
    its('stdout') { should match(/"version":\s*"1.0.7"/) }
  end
end
