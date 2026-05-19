# frozen_string_literal: true

control 'nodejs-default-01' do
  impact 1.0
  title 'Node.js commands are available'

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
end

control 'nodejs-default-02' do
  impact 0.7
  title 'Configured npm packages are converged'

  describe command('npm list -json -global') do
    its('stdout') { should_not match(/"express"/) }
    its('stdout') { should match(/"socket.io"/) }
  end
end
