require 'spec_helper'

describe 'default recipe on Ubuntu 14.04' do
  let(:chef_run) do
    ChefSpec::ServerRunner.new do |node|
      node.automatic[:lsb][:codename] = 'trusty'
    end.converge('nodejs::default')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
