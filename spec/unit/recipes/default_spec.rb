require 'spec_helper'

describe 'default recipe on ubuntu 14.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '14.04') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on ubuntu 16.04' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on centos 6' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'centos', version: '6.8') }
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
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'centos', version: '7.3.1611') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on debian 7' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'debian', version: '7.11') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end

describe 'default recipe on debian 8' do
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'debian', version: '8.9') }
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
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'mac_os_x', version: '10.12') }
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
  let(:runner) { ChefSpec::ServerRunner.new(platform: 'fedora', version: '26') }
  let(:chef_run) { runner.converge('nodejs::default') }

  it 'includes the package install recipes' do
    expect(chef_run).to include_recipe('nodejs::nodejs_from_package')
    expect(chef_run).to include_recipe('nodejs::npm_packages')
  end

  it 'converges successfully' do
    expect { :chef_run }.to_not raise_error
  end
end
