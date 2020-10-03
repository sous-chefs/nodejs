control 'packages should install' do
  describe package('nodejs') do
    it { should be_installed }
  end

  describe package('acpid') do
    it { should be_installed }
  end

  describe package('adcli') do
    it { should_not be_installed }
  end
end
