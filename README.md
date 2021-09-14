# [nodejs-cookbook](https://github.com/redguide/nodejs)

[![Cookbook Version](https://img.shields.io/cookbook/v/nodejs.svg)](https://supermarket.chef.io/cookbooks/nodejs)
[![CI State](https://github.com/sous-chefs/nodejs/workflows/ci/badge.svg)](https://github.com/sous-chefs/nodejs/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Installs node.js/npm and includes a resource for managing npm packages

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

- Debian/Ubuntu
- RHEL/CentOS/Scientific/Amazon/Oracle
- openSUSE
- Windows

Note: Source installs require GCC 4.8+, which is not included on older distro releases

### Chef

- Chef Infra Client 15.3+

### Cookbooks

- ark

## Usage

Include the nodejs recipe to install node on your system based on the default installation method:

```ruby
include_recipe "nodejs"
```

### Install methods

#### Package

Install node from packages:

```ruby
node['nodejs']['install_method'] = 'package' # Not necessary because it's the default
include_recipe "nodejs"
# Or
include_recipe "nodejs::nodejs_from_package"
```

By default this will setup deb/rpm repositories from nodesource.com, which include up to date NodeJS packages. If you prefer to use distro provided package you can disable this behavior by setting `node['nodejs']['install_repo']` to `false`.

#### Binary

Install node from official prebuilt binaries:

```ruby
node['nodejs']['install_method'] = 'binary'
include_recipe "nodejs"

# Or
include_recipe "nodejs::nodejs_from_binary"

# Or set a specific version of nodejs to be installed
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['version'] = '5.9.0'
node.default['nodejs']['binary']['checksum'] = '99c4136cf61761fac5ac57f80544140a3793b63e00a65d4a0e528c9db328bf40'

# Or fetch the binary from your own location
node.default['nodejs']['install_method'] = 'binary'
node.default['nodejs']['binary']['url'] = 'https://s3.amazonaws.com/my-bucket/node-v7.8.0-linux-x64.tar.gz'
node.default['nodejs']['binary']['checksum'] = '0bd86f2a39221b532172c7d1acb57f0b0cba88c7b82ea74ba9d1208b9f6f9697'
```

#### Source

Install node from sources:

```ruby
node['nodejs']['install_method'] = 'source'
include_recipe "nodejs"
# Or
include_recipe "nodejs::nodejs_from_source"
```

#### Chocolatey

Install node from chocolatey:

```chef
node['nodejs']['install_method'] = 'chocolatey'
include_recipe "nodejs"
# Or
include_recipe "nodejs::nodejs_from_chocolatey"
```

## NPM

Npm is included in nodejs installs by default. By default, we are using it and call it `embedded`. Adding recipe `nodejs::npm` assure you to have npm installed and let you choose install method with `node['nodejs']['npm']['install_method']`

```ruby
include_recipe "nodejs::npm"
```

_Warning:_ This recipe will include the `nodejs` recipe, which by default includes `nodejs::nodejs_from_package` if you did not set `node['nodejs']['install_method']`.

## Resources

### npm_package

note: This resource was previously named nodejs_npm. Calls to that resource name will still function, but cookbooks should be updated for the new npm_package resource name.

`npm_package` lets you install npm packages from various sources:

- npm registry:

  - name: `property :package`
  - version: `property :version` (optional)

- url: `property :url`

  - for git use `git://{your_repo}`

- from a json (package.json by default): `property :json`

  - use `true` for default
  - use a `String` to specify json file

Packages can be installed globally (by default) or in a directory (by using `attribute :path`)

You can specify an `NPM_TOKEN` environment variable for accessing [NPM private modules](https://docs.npmjs.com/private-modules/intro) by using `attribute :npm_token`

You can specify a `NODE_ENV` environment variable, in the case that some element of your installation depends on this by using `attribute :node_env`. E.g., using [`node-config`](https://www.npmjs.com/package/config) as part of your postinstall script. Please note that adding the `--production` option will override this to `NODE_ENV=production`.

You can append more specific options to npm command with `attribute :options` array :

You can specify auto_update as false to stop the npm install command from running and updating an installed package. Running the command will update packages within restrictions imposed by a package.json file. The default behavior is to update automatically.

- use an array of options (w/ dash), they will be added to npm call.
- ex: `['--production','--force']` or `['--force-latest']`

You can specify live_stream true for the resource to have the package install information included in the chef-client log outout for better npm package diagnostics and trouble shooting.

This LWRP attempts to use vanilla npm as much as possible (no custom wrapper).

### Packages

```ruby
npm_package 'express'

npm_package 'async' do
  version '0.6.2'
end

npm_package 'request' do
  url 'github mikeal/request'
end

npm_package 'grunt' do
  path '/home/random/grunt'
  json true
  user 'random'
  node_env 'staging'
end

npm_package 'my_private_module' do
  path '/home/random/myproject' # The root path to your project, containing a package.json file
  json true
  npm_token '12345-abcde-e5d4c3b2a1'
  user 'random'
  options ['--production'] # Only install dependencies. Skip devDependencies
end
```

[Working Examples](test/cookbooks/nodejs_test/recipes/npm.rb)

Or add packages via attributes (which accept the same attributes as the LWRP above):

```json
"nodejs": {
  "npm_packages": [
    {
      "name": "express"
    },
    {
      "name": "async",
      "version": "0.6.2"
    },
    {
      "name": "request",
      "url": "github mikeal/request"
    }
    {
      "name": "grunt",
      "path": "/home/random/grunt",
      "json": true,
      "user": "random"
    }
  ]
}
```

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100)
![https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100)
