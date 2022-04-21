control 'commands should exist' do
  describe command('node -v') do
    its('exit_status') { should eq 0 }
  end

  describe command('npm -v') do
    its('exit_status') { should eq 0 }
  end

  describe file '/home/random/staging' do
    it { should exist }
  end

  describe command('npm list -json -global') do
    its('stdout') { should match(/express/) }
    its('stdout') { should match(/"async": {\n\s*"version": "0.6.2"/) }
    its('stdout') { should match(/request/) }
    its('stdout') { should match(/mocha/) }
  end

  describe command('npm list xss -json -global') do
    its('stdout') { should match(/"version":\s*"1.0.7"/) }
  end

  describe command('npm list minify -json -global') do
    its('stdout') { should_not match(/"version":\s*"5.2.0"/) }
  end

  describe command('export NPM_TOKEN="123-abcde" && cd /home/random && npm list -json') do
    its('stdout') { should match(/koa/) }
    its('stdout') { should match(/gulp/) }
  end

  describe command('export NPM_TOKEN="123-abcde" && cd /home/random1 && npm list -json') do
    its('stdout') { should match(/koa/) }
    its('stdout') { should match(/gulp/) }
  end

  describe command('export NPM_TOKEN="123-abcde" && cd /home/random2 && npm list -json') do
    its('stdout') { should match(/grunt/) }
    its('stdout') { should match(/vary/) }
  end
end
