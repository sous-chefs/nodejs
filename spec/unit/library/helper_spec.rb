
require 'rspec_helper'
require 'mixlib/shellout'
require 'ostruct'

describe 'helper methods' do
  before(:each) do
    @mt = MT.new
  end

  describe 'npm_dist' do
    it 'should return a url if specified in the node attributes' do
      n = { 'nodejs': { 'npm': { 'url': 'get it' } } }
      n = Mash.new(n)
      allow(@mt).to receive(:node).and_return(n)
      expect(@mt.npm_dist()['url']).to eq('get it')
    end
    it 'should return a url based on the version' do
      n = { 'nodejs': { 'npm': { 'url': nil, 'version': '6.14.8' } } }
      n = Mash.new(n)
      allow(@mt).to receive(:node).and_return(n)
      expect(@mt.npm_dist()['url']).to eq('https://registry.npmjs.org/npm/-/npm-6.14.8.tgz')
    end
  end

  describe 'npm_list' do
    it 'should list information for a package' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      expect(@mt.npm_list('xss')).to eq({ 'dependencies' => { 'xss' => { 'from' => 'xss', 'resolved' => 'https://registry.npmjs.org/xss/-/xss-1.0.8.tgz', 'version' => '1.0.8' } } })
    end
    it 'should handle bad output fomr the npm list command' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npminvalid)
      expect(@mt.npm_list('other')).to eq({})
    end
  end

  describe 'url_valid?' do
    it 'should return true the url of an installed package for a valid value' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      list = @mt.npm_list('xss')['dependencies']
      expect(@mt.url_valid?(list, 'xss')).to be_truthy
    end
    it 'should return true an installed package that does not have a url' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmcssfilter)
      list = @mt.npm_list('cssfilter')['dependencies']
      expect(@mt.url_valid?(list, 'cssfilter')).to eq(true)
    end
    it 'should return false for an installed package that has an invalid url' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmglobal)
      list = @mt.npm_list('security')['dependencies']
      expect(@mt.url_valid?(list, 'security')).to eq(false)
    end
  end

  describe 'version_valid?' do
    it 'should check that the installed version of a package matches the expected' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      list = @mt.npm_list('xss')['dependencies']
      expect(@mt.version_valid?(list, 'xss', '1.0.8')).to be_truthy
    end
    it 'should return false if the version a package does not match the expected' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      list = @mt.npm_list('xss')['dependencies']
      expect(@mt.version_valid?(list, 'xss', '1.1.1')).to be_falsy
    end
  end

  describe 'npm_package_installed?' do
    it 'should return false if any of the checks fail - wrong version' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      expect(@mt.npm_package_installed?('xss', '1.1.1')).to be_falsy
    end
    it 'should return false if any of the checks fail - nothing found' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmempty)
      expect(@mt.npm_package_installed?('xss')).to be_falsy
    end
    it 'should return true checking package and version' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      expect(@mt.npm_package_installed?('xss', '1.0.8')).to be_truthy
    end
    it 'should return true checking package installed' do
      allow_any_instance_of(Mixlib::ShellOut).to receive(:run_command).and_return(npmxss)
      expect(@mt.npm_package_installed?('xss')).to be_truthy
    end
  end
end

class MT
  include NodeJs::Helper
end

def npmempty
  os = OpenStruct.new
  os.stdout =
  '{}'
  os
end

def npmglobal
  os = OpenStruct.new
  os.stdout =
  '{
    "dependencies": {
      "dtrace": {
        "version": "0.0.0",
        "from": "dtrace",
        "resolved": "https://registry.npmjs.org/dtrace/-/dtrace-0.0.0.tgz"
      },
      "dtrace-provider": {
        "version": "0.8.8",
        "from": "dtrace-provider",
        "resolved": "https://registry.npmjs.org/dtrace-provider/-/dtrace-provider-0.8.8.tgz",
        "dependencies": {
          "nan": {
            "version": "2.14.1",
            "from": "nan@^2.14.0",
            "resolved": "https://registry.npmjs.org/nan/-/nan-2.14.1.tgz"
          }
        }
      },
      "sax": {
        "version": "1.2.4",
        "from": "sax",
        "resolved": "https://registry.npmjs.org/sax/-/sax-1.2.4.tgz"
      },
      "security": {
        "version": "1.0.0",
        "from": "security",
        "resolved": "http://invalid##registry.npmjs.org/security/-/security-1.0.0.tgz"
      },
      "xss": {
        "version": "1.0.8",
        "from": "xss",
        "resolved": "https://registry.npmjs.org/xss/-/xss-1.0.8.tgz",
        "dependencies": {
          "commander": {
            "version": "2.20.3",
            "from": "commander@^2.20.3",
            "resolved": "https://registry.npmjs.org/commander/-/commander-2.20.3.tgz"
          },
          "cssfilter": {
            "version": "0.0.10",
            "from": "cssfilter@0.0.10"
          }
        }
      }
    }
  }'
  os
end

def npminvalid
  os = OpenStruct.new
  os.stdout =
  'Invalid return'
  os
end

def npmxss
  os = OpenStruct.new
  os.stdout =
  '{
    "dependencies": {
      "xss": {
        "version": "1.0.8",
        "from": "xss",
        "resolved": "https://registry.npmjs.org/xss/-/xss-1.0.8.tgz"
     }
    }
  }'
  os
end

def npmcssfilter
  os = OpenStruct.new
  os.stdout =
  '{
    "dependencies": {
      "xss": {
        "version": "1.0.8",
        "from": "xss",
        "resolved": "https://registry.npmjs.org/xss/-/xss-1.0.8.tgz",
        "dependencies": {
          "cssfilter": {
            "version": "0.0.10",
            "from": "cssfilter@0.0.10",
            "resolved": "https://registry.npmjs.org/cssfilter/-/cssfilter-0.0.10.tgz"
          }
        }
      }
    }
  }'
  os
end
