## DESCRIPTION

[![Circle CI](https://circleci.com/gh/erulabs/nodejs/tree/master.png)](https://circleci.com/gh/erulabs/nodejs/tree/master)

Installs Node.js or io.js, NPM and provides an NPM LWRP. This cookbook is more or less a rewrite of [redguide's nodejs cookbook](https://github.com/redguide/nodejs) - however, it has been updated to allow io.js, I have removed the ability to install from anywhere other than binary (to encourage best practices from a Node operations standpoint). Additionally, the npm lwrp no longer forces package based installation.

## USAGE

Install node:

```chef
include_recipe 'nodejs'
```

Install io.js:

```chef
node.default['nodejs']['fork'] = 'iojs'
include_recipe 'nodejs'
```

Override versions:

```chef
node.default['nodejs']['fork'] = 'iojs'
node.default['nodejs']['iojs']['version'] = '1.5.1'
# Find checksums with 'curl -L -s URL-TO-tar.gz | shasum -a 256'
node.default['nodejs']['node']['checksums']['1.5.1'] = {
  'x64' => '1598b95cb6e1a4b664ea0a8fc69d0cf53e597bbd1164a94966fc3e34f63a7447',
  'x86' => 'fc82c32221c48d1021b1bee5867bf8c54ae2d5914c7d1f8281be587ad4307576'
}
include_recipe 'nodejs'
```

## NPM

Npm is included in nodejs installs by default. By default we'll use the latest version we can (literally `npm@latest`). That can be overridden:
```chef
node.default['nodejs']['npm']['version'] = 'latest'
include_recipe 'nodejs'
```

## LWRP

### nodejs_npm

`nodejs_npm` let you install npm packages from various sources:
* npm registry:
 * name: `attribute :package`
 * version: `attribute :version` (optionnal)
* url: `attribute :url`
 * for git use `git://{your_repo}`
* from a json (packages.json by default): `attribute :json`
 * use `true` for default
 * use a `String` to specify json file

Packages can be installed globally (by default) or in a directory (by using `attribute :path`)

You can append more specific options to npm command with `attribute :options` array :
 * use an array of options (w/ dash), they will be added to npm call.
 * ex: `['--production','--force']` or `['--force-latest']`

This LWRP try to use npm bare as much as possible (no custom wrapper).

### Packages

```chef
# Install something globally
nodejs_npm 'gulp'

# With a particular version
nodejs_npm 'grunt' do
  version '0.4.5'
end

# Install from github
nodejs_npm 'request' do
  url 'github mikeal/request'
end

# Install a project from it's 'package.json'
nodejs_npm "some_application" do
  path "/home/random/grunt"
  json true
  user "random"
  options ['--production']
end
```

## AUTHORS

* Marius Ducea (marius@promethost.com)
* Nathan L Smith (nlloyds@gmail.com)
* Guilhem Lettron (guilhem@lettron.fr)
* Barthelemy Vessemont (bvessemont@gmail.com)
* Seandon Mooy (seandon.mooy@gmail.com)
