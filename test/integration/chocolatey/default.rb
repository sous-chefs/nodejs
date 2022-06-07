control 'commands should exist' do
  describe command('node -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npm list -json --location=global') do
    its('stdout') { should match(/express/) }
    its('stdout') { should match(/async@0.6.2/) }
    its('stdout') { should match(/request/) }
    its('stdout') { should match(/mocha/) }
  end
end
