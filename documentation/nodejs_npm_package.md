# npm_package

Installs or removes an npm package. The legacy `nodejs_npm` alias is retained.

## Actions

| Action | Description |
|--------|-------------|
| `:install` | Installs or updates an npm package. Default. |
| `:uninstall` | Uninstalls an npm package if present. |
| `:remove` | Alias-style remove action for uninstalling an npm package. |

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `package` | String | name property | npm package name. |
| `version` | String | `nil` | npm package version. |
| `path` | String | `nil` | Local project path. Omit for global installs. |
| `url` | String | `nil` | Package URL or git source. |
| `json` | String, true, false | `nil` | Install from `package.json` or a provided JSON/tarball source. |
| `npm_token` | String | `nil` | Sensitive NPM token exposed as `NPM_TOKEN`. |
| `options` | Array | `[]` | Extra npm CLI options. |
| `user` | String | `nil` | User for the npm command. |
| `group` | String | `nil` | Group for the npm command. |
| `live_stream` | true, false | `false` | Streams npm output to the Chef log. |
| `node_env` | String | `nil` | `NODE_ENV` value for the npm command. |
| `auto_update` | true, false | `true` | When false, skips install if the matching package is already installed. |

## Examples

```ruby
npm_package 'express'
```

```ruby
npm_package 'async' do
  version '0.6.2'
end
```

```ruby
nodejs_npm 'mocha' do
  options ['--production']
end
```
