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

default['nodejs']['engine'] = 'node'
case node['platform_family']
when 'smartos', 'rhel', 'debian', 'fedora', 'mac_os_x', 'suse', 'amazon', 'windows'
  default['nodejs']['install_method'] = 'package'
else
  default['nodejs']['install_method'] = 'source'
end

default['nodejs']['version'] = '6.11.2'

default['nodejs']['checksum']['6.11.2']['tar.gz'] = '20146ed51b638404665737ed8a25cc06e96d7d7259eb90a4bdec4730a78002a6'
default['nodejs']['checksum']['6.11.2']['tar.xz'] = '04af4992238b19124ea56f1bcfda36827613a24eb3b00fc3b50f261a415a26e4'
default['nodejs']['checksum']['6.11.2']['aix']['ppc64']['tar.gz'] = '79ead2addfa70ea471406f48917530822e9214acd2351d1f02401b3c4dd7a34a'
default['nodejs']['checksum']['6.11.2']['darwin']['x64']['tar.gz'] = '810669aa5f812d02679c121c123a2b200e55abaa5a27aacf00b571f3cf3727d1'
default['nodejs']['checksum']['6.11.2']['darwin']['x64']['tar.xz'] = 'a2e81b5f60bd8a6de90e37c70d024fe61b1caa54dbe2f076a10abe673f490073'
default['nodejs']['checksum']['6.11.2']['linux']['arm64']['tar.gz'] = '914465dd907d2d785a6cb2e166ada7ce1e070f212267ce88ba7a326fe549a076'
default['nodejs']['checksum']['6.11.2']['linux']['arm64']['tar.xz'] = 'c94e2cf7a68c34b2c93af2388b57f71e730a0736cec80b37ad8700210835f7a4'
default['nodejs']['checksum']['6.11.2']['linux']['armv6l']['tar.gz'] = nil
default['nodejs']['checksum']['6.11.2']['linux']['armv6l']['tar.xz'] = nil
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
default['nodejs']['checksum']['6.11.2']['x64']['msi'] = 'ce57b050e11b3b8d46e18c85512384c8e2b1c0bd9f7832ba9786e175152a02a0'
default['nodejs']['checksum']['6.11.2']['x86']['msi'] = '7799df1770f0574c3fbc60343ed77a7823b3104910c9a5ebcb3e08c1e8c8eb28'

default['nodejs']['checksum']['8.2.1']['tar.gz'] = '66fe1379bc7daf9a16c6b5c45ab695bf1cdcfae9738d2989e940104d6b31973f'
default['nodejs']['checksum']['8.2.1']['tar.xz'] = '02c46d8914540eea73d0ad33bf9f371a28aa0dc8c5d740948491fef044ad8c8b'
default['nodejs']['checksum']['8.2.1']['aix']['ppc64']['tar.gz'] = 'b6343e1d396dff5b29a62eff0550a7782a6b82b18625fb29cebd6735b30851f3'
default['nodejs']['checksum']['8.2.1']['darwin']['x64']['tar.gz'] = '32d0923c147470d57f18f055014f5a9fe8a3919406010a2e80ba85952d3c9923'
default['nodejs']['checksum']['8.2.1']['darwin']['x64']['tar.xz'] = '9f8eb5e5ee0a4a17a08b186543e945a7e995696af7726dd8c7325235e750917d'
default['nodejs']['checksum']['8.2.1']['linux']['arm64']['tar.gz'] = '914a031d02cbf759238fa1c051bc21739abfa15572eae77c03cc34c37031b3ef'
default['nodejs']['checksum']['8.2.1']['linux']['arm64']['tar.xz'] = '9ed01737f37d410067beeb42066e51f6d0385677c7d0daeeaf2e32cb2aca854a'
default['nodejs']['checksum']['8.2.1']['linux']['armv6l']['tar.gz'] = 'b98a17579636cf6cc46f0fe721fcf3b0b360f27c77678754e1eebe27a70625f1'
default['nodejs']['checksum']['8.2.1']['linux']['armv6l']['tar.xz'] = '167ccad4c6a848a7b17ead0b2d95770e984a2c8d69ddd42ea78813174daee716'
default['nodejs']['checksum']['8.2.1']['linux']['armv7l']['tar.gz'] = '97a2752cfe0ee1ae9225de4a3787a79f4b82c5679122019aff20835b09ecb62e'
default['nodejs']['checksum']['8.2.1']['linux']['armv7l']['tar.xz'] = '52a3abbf9450fbb91b39aaa268977a593daa8fc7dec0925d32ac7afd3a3596e2'
default['nodejs']['checksum']['8.2.1']['linux']['ppc64le']['tar.gz'] = 'b01cb4d1f04c52d68faf90157bc234e907b4206c0a4057e8911bdda184fd1f50'
default['nodejs']['checksum']['8.2.1']['linux']['ppc64le']['tar.xz'] = '8f1f6896b9f49159e6a6a8fcf7b8d68245b3f007296dd2898f01dbc3b29e88f3'
default['nodejs']['checksum']['8.2.1']['linux']['ppc64']['tar.gz'] = '15cac8d58ab6dc53b3a4356bd11401211b1e09f2076c4d7699d58015c7c88a01'
default['nodejs']['checksum']['8.2.1']['linux']['ppc64']['tar.xz'] = 'e47cd5d9b3cc0946287f8254cb8d35f4c42bda35604e4446fb498af8de1c3a6b'
default['nodejs']['checksum']['8.2.1']['linux']['s390x']['tar.gz'] = 'd8f391e401ab2124e0c47f5c497d497e9b80819ee30fcd94033825e52a1e1f70'
default['nodejs']['checksum']['8.2.1']['linux']['s390x']['tar.xz'] = '7af75022ec9a37fd59890add4a8165a7b6d6f9300bc94abab32a97de3fd0e7a8'
default['nodejs']['checksum']['8.2.1']['linux']['x64']['tar.gz'] = 'c082cf6e7011d4222d476c86421ae6a656d7d34d3d34133260e19a7718de88c9'
default['nodejs']['checksum']['8.2.1']['linux']['x64']['tar.xz'] = 'abcddeb95cc4465953b1edb0922d20e9b0b3de83688fc8150b863117032a978a'
default['nodejs']['checksum']['8.2.1']['linux']['x86']['tar.gz'] = '79d1364e09434bdfe0e925b1e7c80691d92cdbc3ad7384ddeacc793eaa54721d'
default['nodejs']['checksum']['8.2.1']['linux']['x86']['tar.xz'] = '4c2b25ce95eba27adea4f72713286d60b25e73d816a128c35110afaace3f3e2d'
default['nodejs']['checksum']['8.2.1']['sunos']['x64']['tar.gz'] = '1afa29cbb224711d25f4cd6dcf4581ea9e692720c7eb45928dbcaebe54a01a81'
default['nodejs']['checksum']['8.2.1']['sunos']['x64']['tar.xz'] = '20872f6e8165b7364dcb961dd0f20ba70b8a2b0fcc875356e7c85180be8a9d65'
default['nodejs']['checksum']['8.2.1']['sunos']['x86']['tar.gz'] = '0bfde8259c1ce4358fd6893add5ac662b2f70c81396388e0e9f23ae6c201ae06'
default['nodejs']['checksum']['8.2.1']['sunos']['x86']['tar.xz'] = '5438318c248230d8175f7edaee2dfb3a7590f54589d391a1608f6d59f56f9967'
default['nodejs']['checksum']['8.2.1']['win']['x64']['7z'] = '1d4709a568ce470f968bef7da4141e071a141474306da55ed00e129d68ef2b39'
default['nodejs']['checksum']['8.2.1']['win']['x64']['zip'] = '37e84e54c67e3d1e52d657c04835b211c94631a0b358f4e7dc351618fdb6c083'
default['nodejs']['checksum']['8.2.1']['win']['x86']['7z'] = '91494c1f4c514770113ccae9069077d567579d0ad7d65547ba32a5682d1d7ffb'
default['nodejs']['checksum']['8.2.1']['win']['x86']['zip'] = 'b4f099c524a12cdf5d1a300c45b3397babf1121a3f56e071d6552c1df7566b0c'
default['nodejs']['checksum']['8.2.1']['x64']['msi'] = '552aeb03a91a95a1b8e5737ba42feed670f59e284b463c17ad00eafa51e31076'
default['nodejs']['checksum']['8.2.1']['x86']['msi'] = '38377ab5acd1dff77a36c980878f48e9a51fa00d4ae471631d2bb5b578cb18e1'

default['nodejs']['prefix_url']['node'] = 'https://nodejs.org/dist/'
default['nodejs']['package']['url'] = nil # Auto generated

default['nodejs']['package']['checksum']['win_x64'] = nil # Auto generated
default['nodejs']['package']['checksum']['win_x86'] = nil # Auto generated

default['nodejs']['source']['url']      = nil # Auto generated
default['nodejs']['source']['checksum'] = nil # Auto generated

default['nodejs']['binary']['url'] = nil # Auto generated
default['nodejs']['binary']['win_install_dir'] = nil # Auto generated

default['nodejs']['binary']['checksum']['aix_ppc64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['darwin_x64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_arm64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_armv6l'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_armv7l'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_ppc64le'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_ppc64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_s390x'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['linux_x86'] = nil # Auto generated
default['nodejs']['binary']['checksum']['sunos_x64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['sunos_x86'] = nil # Auto generated
default['nodejs']['binary']['checksum']['win_x64'] = nil # Auto generated
default['nodejs']['binary']['checksum']['win_x86'] = nil # Auto generated

default['nodejs']['make_threads'] = node['cpu'] ? node['cpu']['total'].to_i : 2

default['nodejs']['manage_node'] = true
