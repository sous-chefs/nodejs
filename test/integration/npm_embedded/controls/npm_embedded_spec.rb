# frozen_string_literal: true

control 'nodejs-npm-embedded-01' do
  impact 1.0
  title 'Embedded npm commands are available'

  describe command('node -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npx -v') do
    its('exit_status') { should eq 0 }
  end
end
