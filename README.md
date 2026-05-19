# [nodejs-cookbook](https://github.com/redguide/nodejs)

[![Cookbook Version](https://img.shields.io/cookbook/v/nodejs.svg)](https://supermarket.chef.io/cookbooks/nodejs)
[![CI State](https://github.com/sous-chefs/nodejs/workflows/ci/badge.svg)](https://github.com/sous-chefs/nodejs/actions?query=workflow%3Aci)
[![OpenCollective](https://opencollective.com/sous-chefs/backers/badge.svg)](#backers)
[![OpenCollective](https://opencollective.com/sous-chefs/sponsors/badge.svg)](#sponsors)
[![License](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://opensource.org/licenses/Apache-2.0)

Provides custom resources for installing Node.js/npm and managing npm packages.

## Maintainers

This cookbook is maintained by the Sous Chefs. The Sous Chefs are a community of Chef cookbook maintainers working together to maintain important cookbooks. If you’d like to know more please visit [sous-chefs.org](https://sous-chefs.org/) or come chat with us on the Chef Community Slack in [#sous-chefs](https://chefcommunity.slack.com/messages/C2V7B88SF).

## Requirements

### Platforms

* Debian/Ubuntu
* RHEL family/Fedora/Amazon Linux
* macOS where platform packages are available
* Windows through Chocolatey

### Chef

* Chef Infra Client 15.3+

### Cookbooks

* ark
* chocolatey

## Usage

Install Node.js with the default platform method:

```ruby
nodejs_install 'nodejs'
```

Install node from packages:

```ruby
nodejs_install 'nodejs' do
  install_method 'package'
  version '24.15.0'
```

Install Node.js from official prebuilt binaries:

```ruby
nodejs_install 'nodejs' do
  install_method 'binary'
```

Install Node.js from source:

```ruby
nodejs_install 'nodejs' do
  install_method 'source'
end
```

Install npm packages:

```ruby
npm_package 'express'

nodejs_npm_packages 'application packages' do
  packages [
    { name: 'socket.io', version: '4.8.1' },
  ]
end
```

See [migration.md](migration.md) for the breaking recipe/attribute migration guide.

## Resources

* [nodejs_install](documentation/nodejs_install.md)
* [nodejs_repository](documentation/nodejs_repository.md)
* [nodejs_npm_install](documentation/nodejs_npm_install.md)
* [nodejs_npm_packages](documentation/nodejs_npm_packages.md)
* [npm_package](documentation/nodejs_npm_package.md)

## Contributors

This project exists thanks to all the people who [contribute.](https://opencollective.com/sous-chefs/contributors.svg?width=890&button=false)

### Backers

Thank you to all our backers!

![<https://opencollective.com/sous-chefs#backers](https://opencollective.com/sous-chefs/backers.svg?width=600&avatarHeight=40>)

### Sponsors

Support this project by becoming a sponsor. Your logo will show up here with a link to your website.

![<https://opencollective.com/sous-chefs/sponsor/0/website](https://opencollective.com/sous-chefs/sponsor/0/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/1/website](https://opencollective.com/sous-chefs/sponsor/1/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/2/website](https://opencollective.com/sous-chefs/sponsor/2/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/3/website](https://opencollective.com/sous-chefs/sponsor/3/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/4/website](https://opencollective.com/sous-chefs/sponsor/4/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/5/website](https://opencollective.com/sous-chefs/sponsor/5/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/6/website](https://opencollective.com/sous-chefs/sponsor/6/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/7/website](https://opencollective.com/sous-chefs/sponsor/7/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/8/website](https://opencollective.com/sous-chefs/sponsor/8/avatar.svg?avatarHeight=100>)
![<https://opencollective.com/sous-chefs/sponsor/9/website](https://opencollective.com/sous-chefs/sponsor/9/avatar.svg?avatarHeight=100>)
