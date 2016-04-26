require 'spec_helper'

describe command('node -v') do
  its(:exit_status) { should eq 0 }
end

describe command('npm -v') do
  its(:exit_status) { should eq 0 }
end
