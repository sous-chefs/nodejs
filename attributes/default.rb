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

default['nodejs']['engine'] = 'node'
default['nodejs']['version'] = '6.11.3'
default['nodejs']['checksumurl'] = 'https://nodejs.org/dist/v6.11.3/SHASUMS256.txt'
default['nodejs']['checksum']['6.11.3']['tar.gz'] = 'c60562a7bc316f137297b7aa23ae354e3ac6779fe8ddf46fe43a75b6b92443e8'
default['nodejs']['checksum']['6.11.3']['tar.xz'] = '5f09b77010cb3ec4e321ecdc30beb6b49d8a2843155b7f0ad97202ec308ab6bc'
default['nodejs']['checksum']['6.11.3']['aix']['ppc64']['tar.gz'] = '7f344d29a6feb0fd77529dc30ce2badd881d8fa382e6bbee97dee45a31b1e322'
default['nodejs']['checksum']['6.11.3']['darwin']['x64']['tar.gz'] = 'be80751e600b37f2228170fe5eeb04d6f0febb6076f586310685ea2a34e558fb'
default['nodejs']['checksum']['6.11.3']['darwin']['x64']['tar.xz'] = 'c86f6508b4e9ff856d566e1d845f3822a3375936faddd8089dc70dfad1b0656b'
default['nodejs']['checksum']['6.11.3']['linux']['arm64']['tar.gz'] = '1a7712fa64989809a6949b08d449af00f93116ccc44e10789ea1615df806ca96'
default['nodejs']['checksum']['6.11.3']['linux']['arm64']['tar.xz'] = '9bbb2d3a7b1530885a93324421031cfc4409f58b61c0963e779cb4ef0573885c'
default['nodejs']['checksum']['6.11.3']['linux']['armv6l']['tar.gz'] = '4e13c00a1a94ade809b7478db98f7664a80b64bd8256eae9bd15b8ca39343ad5'
default['nodejs']['checksum']['6.11.3']['linux']['armv6l']['tar.xz'] = '8d1b8d80b21b27ceb82255a1563356d4ce5a3d0213985be43285f3cfd76bed78'
default['nodejs']['checksum']['6.11.3']['linux']['armv7l']['tar.gz'] = '7588ee46820af77a6ee286bd51799f403810dd20a688cece227e241a37ec863c'
default['nodejs']['checksum']['6.11.3']['linux']['armv7l']['tar.xz'] = '31ddf7b326ca9f02bcd9bafc401889c39e651c854262a3ffdbbfdc1fcd594728'
default['nodejs']['checksum']['6.11.3']['linux']['ppc64le']['tar.gz'] = 'ef6b281b37412f239a0b7ba0b081e5ce49e875e79de6af62e4afd98dc3db9ffd'
default['nodejs']['checksum']['6.11.3']['linux']['ppc64le']['tar.xz'] = 'e0a38534de88323b630df29dd4731f6701b6fee66382f1d1ef80ec757adde9d9'
default['nodejs']['checksum']['6.11.3']['linux']['ppc64']['tar.gz'] = 'b0800910c26cd7804748925ff61d20d8ec7d26be8b3f7a41b0c6e1499cb2212b'
default['nodejs']['checksum']['6.11.3']['linux']['ppc64']['tar.xz'] = '4b420d632977dae87baf6f71d53ca463966bcd99f7dcc443d736517d0f52c5c0'
default['nodejs']['checksum']['6.11.3']['linux']['s390x']['tar.gz'] = '95ac7ca0842ff3ec5fd6e423adf924d69442a6dac2f718a225432d1c99cb18c3'
default['nodejs']['checksum']['6.11.3']['linux']['s390x']['tar.xz'] = '75776ce338c1ee66a51b0317d9493c772423e689a9d22bc717c311d3b675220a'
default['nodejs']['checksum']['6.11.3']['linux']['x64']['tar.gz'] = '610705d45eb2846a9e10690678a078d9159e5f941487aca20c6f53b33104358c'
default['nodejs']['checksum']['6.11.3']['linux']['x64']['tar.xz'] = 'c8e1ad4b731e15e1318465a616f2283055e145e0b17a3a04d5591ec264cd30d3'
default['nodejs']['checksum']['6.11.3']['linux']['x86']['tar.gz'] = '9c82c884cbe971f5e69303077aacedd76cc76ff684d5c4ab3daa7e8881a15c95'
default['nodejs']['checksum']['6.11.3']['linux']['x86']['tar.xz'] = '9afabd3b547bc96345898242cf81553738bf4e4f63a7e40de852a46ab109e390'
default['nodejs']['checksum']['6.11.3']['sunos']['x64']['tar.gz'] = 'c60ac1aefb553f28df5a821fb0ec27a7da1bff5c1fe333a9be9ea84d7f488195'
default['nodejs']['checksum']['6.11.3']['sunos']['x64']['tar.xz'] = '68481b66cc23252c320284f687e7d7e097ab35006ba65749cdc1f57461c8db28'
default['nodejs']['checksum']['6.11.3']['sunos']['x86']['tar.gz'] = '2abec834dce32503478d7b97570624327fa77ee0cabbc91ab83a0ed57bd7c01f'
default['nodejs']['checksum']['6.11.3']['sunos']['x86']['tar.xz'] = 'f6d83797c9893ca9e63ef32358b4b6702605feca2c979d394498fdae05458cd5'
default['nodejs']['checksum']['6.11.3']['win']['x64']['7z'] = 'a767bca7033cbbde3294080728b564145ac4fbf13f408a9070d9b5acc5c56068'
default['nodejs']['checksum']['6.11.3']['win']['x64']['zip'] = '3e1bde603d29f0965a9b2ed4f025067c88a7f97eef6953268cba818c396aad65'
default['nodejs']['checksum']['6.11.3']['win']['x86']['7z'] = '59e1dd9dbd312cb16a3a2c1a549625c8d5352d1465d91f47889818beeafa625b'
default['nodejs']['checksum']['6.11.3']['win']['x86']['zip'] = '1f0be54016ba7efddf210564c5ea748ccdeb2aad0f92af6f826ce7b7fa746ab8'
default['nodejs']['checksum']['6.11.3']['x64']['msi'] = 'ea3007f9f4c714afd5947581463814a487501bbb9dc95a498112b4d24d4ce07f'
default['nodejs']['checksum']['6.11.3']['x86']['msi'] = '4e43e285a34dc1afc49665174db56fdb60f28c9cdf49491aea54910dcc142cdb'

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
