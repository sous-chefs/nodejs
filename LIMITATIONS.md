# Limitations

This cookbook defaults to Node.js 24 LTS, using Node.js v24.15.0 checksums from the official `SHASUMS256.txt` published for `latest-v24.x` on 2026-04-16.

Sources checked on 2026-04-29:

* Node.js release schedule: https://github.com/nodejs/Release/blob/main/schedule.json
* Node.js latest v24 artifacts: https://nodejs.org/dist/latest-v24.x/
* Node.js v24 checksums: https://nodejs.org/dist/latest-v24.x/SHASUMS256.txt
* NodeSource distributions page: https://nodesource.com/products/distributions
* NodeSource distributions repository: https://github.com/nodesource/distributions

## Package Availability

### APT (Debian/Ubuntu)

NodeSource documents Node 24 packages for:

* Ubuntu 20.04, 22.04, 24.04: `amd64`, `armhf`, `arm64`
* Debian 10, 11, 12: `amd64`, `armhf`, `arm64`

The cookbook only declares currently supported, non-EOL Debian/Ubuntu platforms in `metadata.rb`: Debian 12 or later and Ubuntu 22.04 or later. NodeSource packages use the `nodistro` repository distribution.

### DNF/YUM (RHEL family)

NodeSource documents RPM packages for RHEL 8/9, Fedora 29+, and Amazon Linux 2023 on `x86_64` and `arm64`. The repository URL pattern used by this cookbook is:

```text
https://rpm.nodesource.com/pub_<major>.x/nodistro/nodejs/$basearch
```

The cookbook declares AlmaLinux, Amazon Linux 2023, CentOS Stream, Fedora, Oracle Linux, Red Hat, and Rocky Linux where current test images are available.

### Zypper (SUSE)

NodeSource does not publish SUSE repository rows in the current distributions documentation. This migration does not declare SUSE/openSUSE support in `metadata.rb`.

### Windows and macOS

Windows support is limited to `nodejs_install` with `install_method 'chocolatey'`. macOS support is limited to package installation through the platform package provider where available. Dokken coverage is Linux-only.

## Architecture Limitations

Official Node.js v24.15.0 source and binary checksums pinned by this cookbook:

| Artifact | SHA256 |
|----------|--------|
| `node-v24.15.0.tar.gz` | `729de494dd2872e5a3a6c32a1cd156a5413d4aca2772b2d873ee86bb5531bcd9` |
| `node-v24.15.0-linux-x64.tar.gz` | `44836872d9aec49f1e6b52a9a922872db9a2b02d235a616a5681b6a85fec8d89` |
| `node-v24.15.0-linux-arm64.tar.gz` | `73afc234d558c24919875f51c2d1ea002a2ada4ea6f83601a383869fefa64eed` |

The `nodejs_install` binary action currently models Linux `x64` and `arm64` checksums. Other official Node.js artifacts can be installed by passing `binary_url` and the matching checksum.

## Source/Compiled Installation

### Build Dependencies

| Platform Family | Packages |
|-----------------|----------|
| Debian | `build-essential`, `libssl-dev`, `python3` |
| RHEL/Fedora/Amazon | `build-essential`, `openssl-devel`, `python3`, `tar` |
| Other | `build-essential`, `python3` |

Source builds are much slower than package or binary installs and are not used as the default Kitchen smoke path.

## Known Issues

* Node.js 20 reaches end-of-life on 2026-04-30, so this migration does not keep old Node 20 defaults.
* NodeSource repository docs currently show some LTS/current labels that lag the official Node.js release schedule. The cookbook version defaults follow the official Node.js release schedule and official Node.js checksum artifacts.
