resource_name :dhparam_key

property :key_size, String, name_property: true

default_action :create

action :create do
  helper = ::ChefCookbook::DHParam.new(node)

  directory helper.base_dir do
    owner 'root'
    group node['root_group']
    mode 0755
    recursive true
    action :create
  end

  key_size = new_resource.key_size.to_i
  key_file = helper.key_file(key_size)

  execute "openssl dhparam #{key_size} -out #{key_file}" do
    user 'root'
    group node['root_group']
    creates key_file
    action :run
  end
end
