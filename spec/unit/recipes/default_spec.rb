require 'spec_helper'

describe 'default recipe on ubuntu 22.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '22.04') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on centos 8' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'centos', version: '8') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    stub_command('dnf module list nodejs').and_return(0)
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on debian 12' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'debian', version: '12') }
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
  let(:chef_run) do
    stub_command('dnf module list nodejs').and_return(0)
    runner.converge('nodejs::default')
  end

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
