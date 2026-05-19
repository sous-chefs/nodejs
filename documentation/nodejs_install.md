# nodejs_install

Installs Node.js from packages, official binaries, source, or Chocolatey.

## Actions

| Action     | Description                                               |
| ---------- | --------------------------------------------------------- |
| `:install` | Installs Node.js. Default.                                |
| `:remove`  | Removes artifacts created by the selected install method. |

## Properties

| Property                  | Type                 | Default                        | Description                                                  |
| ------------------------- | -------------------- | ------------------------------ | ------------------------------------------------------------ |
| `version`                 | String               | `'24.15.0'`                    | Node.js version for source, binary, and Chocolatey installs. |
| `install_method`          | String               | platform default               | One of `package`, `binary`, `source`, or `chocolatey`.       |
| `install_repository`      | true, false          | `true`                         | Configures NodeSource repositories for package installs.     |
| `packages`                | Array, nil           | platform default               | Package names to install for package installs.               |
| `package_action`          | Symbol, String       | `:install`                     | Action passed to package resources.                          |
| `package_options`         | String, nil          | `nil`                          | Options passed to package resources.                         |
| `disable_dnf_module`      | true, false          | `true`                         | Disables the distro Node.js DNF module on EL/Fedora 8+.      |
| `prefix_url`              | String               | `'<https://nodejs.org/dist/'`> | Base URL for official Node.js source and binary artifacts.   |
| `source_url`              | String, nil          | `nil`                          | Override URL for source installs.                            |
| `source_checksum`         | String, nil          | official v24.15.0 checksum     | Source tarball checksum.                                     |
| `binary_url`              | String, nil          | `nil`                          | Override URL for binary installs.                            |
| `binary_checksums`        | Hash                 | official v24.15.0 checksums    | Binary checksums by architecture key.                        |
| `append_env_path`         | true, false          | `true`                         | Passed to `ark` for binary installs.                         |
| `make_threads`            | Integer, String, nil | CPU count                      | Parallel make jobs for source installs.                      |
| `build_packages`          | Array, nil           | platform default               | Build dependency package list for source installs.           |
| `chocolatey_package_name` | String               | `'nodejs-lts'`                 | Chocolatey package name for Windows installs.                |

## Examples

```ruby
nodejs_install 'nodejs'
```

```ruby
nodejs_install 'nodejs from source' do
  install_method 'source'
  make_threads 4
end
```

```ruby
nodejs_install 'nodejs from binary' do
  install_method 'binary'
end
```
