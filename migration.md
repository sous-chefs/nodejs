# Migration Guide

This release is a breaking migration from recipes and node attributes to custom resources.

## What Changed

The cookbook no longer exposes `nodejs::default`, `nodejs::install`, `nodejs::repo`, `nodejs::npm`, `nodejs::npm_packages`, or the install-method recipes. The `attributes/` directory was removed. Configure Node.js through resource properties instead of `node['nodejs']` attributes.

## Recipe to Resource Mapping

| Before                                            | After                                                         |
| ------------------------------------------------- | ------------------------------------------------------------- |
| `include_recipe 'nodejs::default'`                | `nodejs_install 'nodejs'` plus optional `nodejs_npm_packages` |
| `include_recipe 'nodejs::repo'`                   | `nodejs_repository 'nodesource'`                              |
| `include_recipe 'nodejs::nodejs_from_package'`    | `nodejs_install 'nodejs' do install_method 'package' end`     |
| `include_recipe 'nodejs::nodejs_from_binary'`     | `nodejs_install 'nodejs' do install_method 'binary' end`      |
| `include_recipe 'nodejs::nodejs_from_source'`     | `nodejs_install 'nodejs' do install_method 'source' end`      |
| `include_recipe 'nodejs::nodejs_from_chocolatey'` | `nodejs_install 'nodejs' do install_method 'chocolatey' end`  |
| `include_recipe 'nodejs::npm'`                    | `nodejs_npm_install 'npm'`                                    |
| `node['nodejs']['npm_packages']`                  | `nodejs_npm_packages 'packages'`                              |

## Examples

Install Node.js from NodeSource packages:

```ruby
nodejs_install 'nodejs' do
  install_method 'package'
  version '24.15.0'
end
```

Install packages that used to be configured with `node['nodejs']['npm_packages']`:

```ruby
nodejs_npm_packages 'application packages' do
  packages [
    { name: 'express' },
    { name: 'socket.io', version: '4.8.1' },
  ]
end
```

The `nodejs_npm` alias still works for the `npm_package` resource, but it no longer auto-includes any Node.js or npm recipes. Install Node.js first:

```ruby
nodejs_install 'nodejs'

nodejs_npm 'express'
```

See `test/cookbooks/test/recipes/` for runnable migration examples used by Kitchen.
