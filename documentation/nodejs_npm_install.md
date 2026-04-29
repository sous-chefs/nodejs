# nodejs_npm_install

Ensures npm is available through the embedded Node.js npm or installs npm from source.

## Actions

| Action | Description |
|--------|-------------|
| `:install` | Installs npm. Default. |
| `:remove` | Removes npm artifacts created by source installs. |

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `install_method` | String | `'embedded'` | One of `embedded` or `source`. |
| `install_node` | true, false | `true` | Installs Node.js before npm. |
| `node_install_method` | String | `'package'` | Node.js install method when `install_node` is true. |
| `version` | String | `'24.15.0'` | Node.js version passed to `nodejs_install`. |
| `prefix_url` | String | `'https://nodejs.org/dist/'` | Node.js artifact base URL passed to `nodejs_install`. |
| `npm_version` | String | `'latest'` | npm version resolved from the npm registry for source installs. |
| `npm_url` | String, nil | `nil` | Override npm tarball URL. |
| `npm_checksum` | String, nil | `nil` | Optional npm tarball checksum. |
| `make_threads` | Integer, String, nil | CPU count | Parallel make jobs for source installs. |

## Examples

```ruby
nodejs_npm_install 'npm' do
  install_method 'embedded'
end
```

```ruby
nodejs_npm_install 'npm from source' do
  install_method 'source'
  npm_version '11.6.2'
end
```
