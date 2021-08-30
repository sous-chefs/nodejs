# NodeJS Cookbook Changelog

## Unreleased

- Standardise files with files in sous-chefs/repo-management

## 7.3.2 - *2021-06-01*

- Standardise files with files in sous-chefs/repo-management

## 7.3.1 - *2020-12-31*

- resolved cookstyle error: attributes/packages.rb:15:55 convention: `Layout/TrailingEmptyLines`
- resolved cookstyle error: test/cookbooks/test/recipes/resource.rb:118:1 convention: `Layout/TrailingEmptyLines`
- Enable builds for opensuse-leap-15
- Add a library method test

## 7.3.0 (2020-10-21)

- Add rspec tests for the library methods
- Update the url_invalid? method to return false if it detects an invalid uri
- Add the auto_update option to the npm_package resource. Allows turning off auto_update of npm packages.
- Allow actions and options for OS package installation to be specified as attributes
- Add the live_stream parameter to the npm_package execution to get better installation diagnostics
- Add the auto_update option to the npm_package resource. Allows turning off auto_update of npm packages.
- Update testing

## 7.2.0 (2020-10-07)

- Verify the URI of installed packages to help determine if a good URI has been installed
- Add tests that verify npm-package installed packages
- Get the example test cookbook working
- Add support for installing node on windows

## 7.1.0 (2020-10-01)

- resolved cookstyle error: recipes/nodejs_from_binary.rb:19:1 refactor: `ChefCorrectness/IncorrectLibraryInjection`
- resolved cookstyle error: recipes/nodejs_from_source.rb:21:1 refactor: `ChefCorrectness/IncorrectLibraryInjection`
- resolved cookstyle error: recipes/npm_from_source.rb:21:1 refactor: `ChefCorrectness/IncorrectLibraryInjection`
- Have ark setup node and npm binaries into PATH
- Add `node_env` to `npm_package` in order to set `NODE_ENV` (useful for some packages)
- Include `npx` as a binary in addition to `npm`, it has been [included since `npm` v5.2.0](https://medium.com/@maybekatz/introducing-npx-an-npm-package-runner-55f7d4bd282b)

## 7.0.1 (2020-06-04)

- Minor readme fix

## 7.0.0 (2020-06-04)

- Require Chef Infra Client 14+ and remove the build-essential dependency
- Updated the default to Node.js v10.16.3
- Added compatibility with Chef Infra Client 16.2+
- Removed Foodcritic testing
- Updated ChefSpec and Kitchen platforms
- Resolved multiple minor cookstyle issues in the cookbook
- Added a vscode editor config

## 6.0.0 (2018-10-11)

- Use the build_essential resource in the source install recipe instead of the build-essential::default recipe. This way we can use the new built-in build_essential resource in Chef 14+
- Set default version to Node.js v8.12.0

## 5.0.0 (2017-11-15)

- nodejs_npm resource has been converted to a custom resource and renamed to npm_package. The existing resource name will continue to function, but over time code should be updated for the new name. This name change has been made so we can eventually merge this resource into the chef-client.
- compat_resource cookbook dependency has been removed and this cookbook instead requires Chef 12.14 or later
- Chef 13 compatibility has been resolved
- The npm_package resource now properly installs packages when the 'package' property is setA
- Speed up npm operations by only returning a list of the desired package instead of every npm package
- Speed up source installation by using multipackage install for the dependencies
- Remove the broken url_valid? helper which didn't work

## 4.0.0 (2017-07-11)

- Updated the cookbook to require Chef 12.1+ and the compat_resource cookbook
- Removed support for io.js which has merged back into the node.js project
- Removed the dependency on homebrew, yum-epel, and apt cookbooks
- Added node['nodejs']['manage_node'] attribute to use only cookbook's LWRP (required to manage node by nvm)
- Updated the default repository URLs to be the 6.X repos
- Added initial support for Suse and Amazon Linux
- Improved architecture detection to support aarch64
- Improved readme with examples for fetching your own binaries
- Added installation of openssl and xz utilities that are needed for the binary install recipe
- Updated the cookbook license string to be an SPDX compliant string
- Set the minimum version of the ark cookbook to 2.0.2 in order to support Suse
- Updated the default version from 6.9.1 to 6.10.2
- Switched to Delivery local mode for testing
- Added Integration testing in Travis CI with kitchen-dokken and ChefDK

## 3.0.0 (2016-11-02)

- Updated the default release to the nodejs 6.9.1\. This requires C++11 extensions to compile, which are only present in GCC 4.8+. Due to this RHEL 5/6 and Ubuntu 12.04 are not supported if using this version.
- Switched the download URLs to the .xz packages since the .tar.gz packages are no longer being created
- Improvements to the readme examples and requirements sections
- Removed installation of apt-transport-https and instead rely on an apt cookbook that will do the same
- Fixed the ChefSpec matchers
- Added Scientific, Oracle, and Amazon as supported distros in the metadata
- Added chef_version metadata
- Removed conflicts and suggests metadata which aren't implemented or recommended for use
- Removed Chef 10 compatibility code
- Switched Integration testing to Inspec from bats
- Added the Apache 2.0 license file to the repo
- Expanded Test Kitchen testing
- Switched from Rubocop to Cookstyle and resolved all warnings
- Switched Travis to testing using ChefDK

## 2.4.4

- Use HTTPS prefix URLs for node download #98
- Update NPM symlink when installing from source #105
- Add support for NPM private modules #107

## v2.4.2

- Fix check version
- Support iojs package install

## v2.4.0

- Move `npm_packages` to his own recipe
- Fix different race conditions when using direct recipe call
- Fix npm recipe

## v2.3.2

- Fix package recipe

## v2.3.0

- Support io.js. Use node['nodejs']['engine'].
- Add MacOS support via homebrew

## v2.2.0

- Add node['nodejs']['keyserver']
- Update arm checksum
- Fix `npm_packages` JSON

## v2.1.0

- Use official nodesource repository
- Add node['nodejs']['npm_packages'] to install npm package with `default` recipe

## v2.0.0

- Travis integration
- Gems updated
- Rewrite cookbook dependencies
- Added complete test-kitchen integration : Rake, rubocop, foodcritic, vagrant, bats testing ...
- Added NodeJS `install_method` option (sources, bins or packages)
- Added NPM `install_method` option (sources or packages)
- NPM version can now be chosen independently from nodejs' embedded version
- Added a `nodejs_npm` LWRP to manage, install and resolve NPM packages

## v1.3.0

- update default versions to the latest: node - v0.10.15 and npm - v1.3.5
- default to package installation of nodejs on smartos ([@wanelo-pair])
- Add Raspberry pi support ([@robertkowalski])

## v1.2.0

- implement installation from package on RedHat - ([@vaskas])

## v1.1.3

- update default version of node to 0.10.13 - and npm - v1.3.4 ([@jodosha][])

## v1.1.2

- update default version of node to 0.10.2 - ([@bakins])
- fully migrated to test-kitchen 1.alpha and vagrant 1.1.x/berkshelf 1.3.1

## v1.1.1

- update default versions to the latest: node - v0.10.0 and npm - v1.2.14
- `make_thread` is now a real attribute - ([@ChrisLundquist])

## v1.1.0

- rewrite the package install; remove rpm support since there are no longer any packages available anywhere
- add support to install `legacy_packages` from ubuntu repo as well as the latest 0.10.x branch (this is default).

## v1.0.4

- add support for binary installation method ([@JulesAU])

## v1.0.3

- 7.3.1 - *2020-12-31*

## v1.0.2

- add smartos support for package install ([@sax])
- support to compile with all processors available (default 2 if unknown) - ([@ChrisLundquist])
- moved to `platform_family` syntax
- ensure npm recipe honours the 'source' or 'package' setting - ([@markbirbeck])
- updated the default versions to the latest stable node/npm

## v1.0.1

- fixed bug that prevented overwritting the node/npm versions (moved the `src_url`s as local variables instead of attributes) - ([@johannesbecker])
- updated the default versions to the latest node/npm

## v1.0.0

- added packages installation support ([@smith])

[@bakins]: https://github.com/bakins
[@chrislundquist]: https://github.com/ChrisLundquist
[@gmccue]: https://github.com/gmccue
[@johannesbecker]: https://github.com/johannesbecker
[@julesau]: https://github.com/JulesAU
[@markbirbeck]: https://github.com/markbirbeck
[@predominant]: https://github.com/predominant
[@robertkowalski]: https://github.com/robertkowalski
[@sax]: https://github.com/sax
[@sjlu]: https://github.com/sjlu
[@smith]: https://github.com/smith
[@vaskas]: https://github.com/vaskas
[@wanelo-pair]: https://github.com/wanelo-pair
