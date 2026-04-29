# nodejs_repository

Configures NodeSource package repositories.

## Actions

| Action | Description |
|--------|-------------|
| `:create` | Creates the NodeSource repository. Default. |
| `:remove` | Removes the NodeSource repository and managed APT keyring. |

## Properties

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `repo_name` | String | name property | Repository name. |
| `node_major` | String, Integer | `'24'` | Node.js major version used in repository URLs. |
| `apt_uri` | String | generated | APT repository URI override. |
| `apt_distribution` | String | `'nodistro'` | APT distribution. |
| `apt_components` | Array | `['main']` | APT components. |
| `apt_key` | String | NodeSource DEB key URL | APT signing key URL. |
| `apt_keyring` | String | `'/etc/apt/keyrings/nodesource.asc'` | Managed APT keyring path. |
| `apt_pin_priority` | String | `'600'` | APT preference priority for NodeSource. |
| `yum_baseurl` | String | generated | YUM/DNF base URL override. |
| `yum_gpgkey` | String | NodeSource RPM key URL | RPM signing key URL. |
| `yum_priority` | String | `'9'` | YUM repository priority. |
| `enabled` | true, false | `true` | Enables the YUM/DNF repository. |
| `gpgcheck` | true, false | `true` | Enables package GPG checks. |

## Examples

```ruby
nodejs_repository 'nodesource' do
  node_major 24
end
```
