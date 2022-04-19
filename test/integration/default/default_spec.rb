
control 'commands should exist' do
  describe command('node -v') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /^v14\.*/ }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /^6\.*/ }
  end

  describe command('npx -v') do
    its('exit_status') { should eq 0 }
    its('stdout') { should match /^6\.*/ }
  end

  describe command('npm list -json -global') do
    its('stdout') { should_not match(/"express"/) }
    its('stdout') { should match(/"socket.io"/) }
  end
end
