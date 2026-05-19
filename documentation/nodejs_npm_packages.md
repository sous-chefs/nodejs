# nodejs_npm_packages

Installs or removes a collection of npm packages.

## Actions

| Action     | Description                                                      |
| ---------- | ---------------------------------------------------------------- |
| `:install` | Converges each package entry with its requested action. Default. |
| `:remove`  | Removes each listed package.                                     |

## Properties

| Property   | Type   | Default   | Description                                                                                      |
| ---------- | ------ | --------- | ------------------------------------------------------------------------------------------------ |
| `packages` | Array  | `[]`      | Array of package hashes. Use `name` for package name and any `npm_package` property for options. |

## Examples

```ruby
nodejs_npm_packages 'application packages' do
  packages [
    { name: 'express' },
    { name: 'socket.io', version: '4.8.1' },
    { name: 'express', action: :remove },
  ]
end
```
