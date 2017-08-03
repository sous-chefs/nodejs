#
# Cookbook Name:: nodejs
# Attributes:: nodejs
#
# Copyright 2010-2012, Promet Solutions
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case node['platform_family']
when 'smartos', 'rhel', 'debian', 'fedora', 'mac_os_x', 'suse', 'amazon', 'windows'
  default['nodejs']['install_method'] = 'package'
else
  default['nodejs']['install_method'] = 'source'
end

default['nodejs']['version'] = '6.11.12'

default['nodejs']['checksum']['6.11.2']['tar.gz'] = '20146ed51b638404665737ed8a25cc06e96d7d7259eb90a4bdec4730a78002a6'
default['nodejs']['checksum']['6.11.2']['tar.xz'] = '04af4992238b19124ea56f1bcfda36827613a24eb3b00fc3b50f261a415a26e4'
default['nodejs']['checksum']['6.11.2']['aix']['ppc64']['tar.gz'] = '79ead2addfa70ea471406f48917530822e9214acd2351d1f02401b3c4dd7a34a'
default['nodejs']['checksum']['6.11.2']['darwin']['x64']['tar.gz'] = '810669aa5f812d02679c121c123a2b200e55abaa5a27aacf00b571f3cf3727d1'
default['nodejs']['checksum']['6.11.2']['darwin']['x64']['tar.xz'] = 'a2e81b5f60bd8a6de90e37c70d024fe61b1caa54dbe2f076a10abe673f490073'
default['nodejs']['checksum']['6.11.2']['linux']['arm64']['tar.gz'] = '914465dd907d2d785a6cb2e166ada7ce1e070f212267ce88ba7a326fe549a076'
default['nodejs']['checksum']['6.11.2']['linux']['arm64']['tar.xz'] = 'c94e2cf7a68c34b2c93af2388b57f71e730a0736cec80b37ad8700210835f7a4'
default['nodejs']['checksum']['6.11.2']['linux']['armv7l']['tar.gz'] = '0e758f5a87eb64bfb623d431cc31a50d1800158d83ab1a5d2f4c6b0d4140e850'
default['nodejs']['checksum']['6.11.2']['linux']['armv7l']['tar.xz'] = 'bc5d8f54c68ef1b7596dac4c793a30c44da747a1c41c99edcdbfb3f17be465ff'
default['nodejs']['checksum']['6.11.2']['linux']['ppc64le']['tar.gz'] = '095d0411667b00518f2ff0ea5eb17e01bfe17fe58b8eb8648e0be87bb89d8fb9'
default['nodejs']['checksum']['6.11.2']['linux']['ppc64le']['tar.xz'] = '166ac9725a1e66cb79a21c42845b3c2ab55c7980fe5e21c3a95d5abce8f28a6c'
default['nodejs']['checksum']['6.11.2']['linux']['ppc64']['tar.gz'] = 'e2a6501f8af6fcf8446d61084baf06a00c8ae728a012aef6d31fe9e16a39a8e2'
default['nodejs']['checksum']['6.11.2']['linux']['ppc64']['tar.xz'] = 'c25682fdb0749724659763a04dff1abe3182379cc2c05584bf7190497036e097'
default['nodejs']['checksum']['6.11.2']['linux']['s390x']['tar.gz'] = 'a6a5a6cdcc03fc45467c8bda99b0932776495065dd8b096b680ba17ec0dd478d'
default['nodejs']['checksum']['6.11.2']['linux']['s390x']['tar.xz'] = '8e566c2345618ec1acd982a7743968038ee0db16303e0f2af77bf8f2f7bc16eb'
default['nodejs']['checksum']['6.11.2']['linux']['x64']['tar.gz'] = '1ca74833ff79e6a3a713a88bba8e7f5f5cda5d4008a6ffeb2293a1bf98f83e04'
default['nodejs']['checksum']['6.11.2']['linux']['x64']['tar.xz'] = 'd8e209417b6e69d2c77d662c59d5b082da6d2290c846ca89af9c1239bb7c3626'
default['nodejs']['checksum']['6.11.2']['linux']['x86']['tar.gz'] = '8fc3878009af0892330fbf1337d6bb0627016baff6581d2fea6ec21225be5149'
default['nodejs']['checksum']['6.11.2']['linux']['x86']['tar.xz'] = '93b1a4dae0249a191e98a4841d860531c378ee2451cbdb6a2ac913304de3c3ae'
default['nodejs']['checksum']['6.11.2']['sunos']['x64']['tar.gz'] = 'b767372038624ea92322c32c13a808446525d3053921ea83c5d23d5da23c6438'
default['nodejs']['checksum']['6.11.2']['sunos']['x64']['tar.xz'] = 'cd4883ce896097540559c918a171734fab8ff77095740f0a65cf474828e9b72c'
default['nodejs']['checksum']['6.11.2']['sunos']['x86']['tar.gz'] = '00561dbf15bccd16e29670f84ccc03905507d31e6434e6a72a1f4a6211fae90e'
default['nodejs']['checksum']['6.11.2']['sunos']['x86']['tar.xz'] = '21536664e7de358e28d5b52e7f6e070cfc1c376b1ff7e67b438727a14be25746'
default['nodejs']['checksum']['6.11.2']['win']['x64']['7z'] = '9189de5ef26e40bc77c2f999368a136c8dfb13d16298c0037a7cd2135adee4be'
default['nodejs']['checksum']['6.11.2']['win']['x64']['zip'] = 'b8a7f49baece10b01a51145edc95d5093e385e9e598a38f2e66c247caf6d0286'
default['nodejs']['checksum']['6.11.2']['win']['x86']['7z'] = 'e38c74a43f72cce05caeaf77afb49f6979345b7a891abdcd5d9e4b72d34cc710'
default['nodejs']['checksum']['6.11.2']['win']['x86']['zip'] = '111631fa1f27b03bc96e3a400460713c79b7f24c924fc0a090983ed207ed8ef7'
default['nodejs']['checksum']['6.11.2']['win']['x64']['msi'] = 'ce57b050e11b3b8d46e18c85512384c8e2b1c0bd9f7832ba9786e175152a02a0'
default['nodejs']['checksum']['6.11.2']['win']['x86']['msi'] = '7799df1770f0574c3fbc60343ed77a7823b3104910c9a5ebcb3e08c1e8c8eb28'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'
default['nodejs']['package']['url'] = nil # Auto generated

default['nodejs']['package']['checksum']['win_x64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['win']['x64']['msi']}"
default['nodejs']['package']['checksum']['win_x86'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['win']['x86']['msi']}"

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['tar.gz']}"

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['win_install_dir'] = nil # Auto generated

default['nodejs']['binary']['checksum']['aix_ppc64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['aix']['ppc64']['tar.xz']}"
default['nodejs']['binary']['checksum']['darwin_x64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['darwin']['x64']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_arm64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['arm64']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_armv7l'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['armv7l']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_ppc64le'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['ppc64le']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_ppc64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['ppc64']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_s390x'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['s390x']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_x64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['x64']['tar.xz']}"
default['nodejs']['binary']['checksum']['linux_x86'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['linux']['x86']['tar.xz']}"
default['nodejs']['binary']['checksum']['sunos_x64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['sunos']['x64']['tar.xz']}"
default['nodejs']['binary']['checksum']['sunos_x86'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['sunos']['x86']['tar.xz']}"
default['nodejs']['binary']['checksum']['win_x64'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['win']['x64']['7z']}"
default['nodejs']['binary']['checksum']['win_x86'] = "#{default['nodejs']['checksum']["#{default['nodejs']['version']}"]['win']['x86']['7z']}"

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true