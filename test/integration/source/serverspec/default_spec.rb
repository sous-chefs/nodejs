require 'spec_helper'

describe command('/usr/local/bin/node -v') do
  its(:exit_status) { should eq 0 }
end

describe command('/usr/local/bin/npm -v') do
  its(:exit_status) { should eq 0 }
end
