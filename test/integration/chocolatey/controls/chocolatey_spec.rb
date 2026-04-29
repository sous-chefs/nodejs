# frozen_string_literal: true

control 'nodejs-chocolatey-01' do
  impact 1.0
  title 'Node.js commands are available on Windows'

  only_if('Windows only') { os.windows? }

  describe command('node -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
  end
end
