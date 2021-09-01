require 'spec_helper'

describe 'default recipe on ubuntu 20.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '20.04') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on centos 7' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'centos', version: '7') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on debian 10' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'debian', version: '10') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on mac_os_x' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'mac_os_x') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on fedora' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'fedora') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
