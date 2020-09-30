apt_update 'update'

include_recipe 'nodejs::default'
include_recipe 'test::resource'
