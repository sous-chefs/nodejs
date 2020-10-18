
control 'commands should exist' do
  describe command('node -v') do
    its('exit_status') { should eq 0 }
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
