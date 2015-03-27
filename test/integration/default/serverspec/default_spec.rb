require 'spec_helper'

describe file('/usr/local/bin/node') do
  it { should be_file }
end

describe file('/usr/local/bin/npm') do
  it { should be_file }
end

describe command('echo "console.log(\"functional test\");" | node') do
  its(:stdout) { should match(/functional test/) }
end
