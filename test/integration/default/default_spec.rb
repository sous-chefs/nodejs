os_family = os.family

control 'commands should exist' do
  describe command('node -v') do
    its('exit_status') { should eq 0 }
    # No upstream repository so it installs the OS version
    unless os_family == 'suse'
      its('stdout') { should match /^v17\.*/ }
    end
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
    # No upstream repository so it installs the OS version
    unless os_family == 'suse'
      its('stdout') { should match /^8\.*/ }
    end
  end

  describe command('npx -v') do
    its('exit_status') { should eq 0 }
    # No upstream repository so it installs the OS version
    unless os_family == 'suse'
      its('stdout') { should match /^8\.*/ }
    end
  end

  describe command('npm list -json -global') do
    its('stdout') { should_not match(/"express"/) }
    its('stdout') { should match(/"socket.io"/) }
  end
end
