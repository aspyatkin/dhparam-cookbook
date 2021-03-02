resource_name :dhparam_file
provides :dhparam_file

property :key_length, Integer, default: 2048
property :path, String, default: '/etc/chef-dhparam'

default_action :create

action :create do
  directory new_resource.path do
    mode '0700'
    recursive true
    action :create
  end

  ::ChefCookbook::DHParam.add(
    node,
    new_resource.name,
    ::File.join(new_resource.path, "#{new_resource.name}.pem")
  )
  file = ::ChefCookbook::DHParam.file(node, new_resource.name)

  execute "generate #{new_resource.key_length}-bit DH parameters file at #{file}" do
    command(lazy { "openssl dhparam -out #{file} #{new_resource.key_length}" })
    action :run
    not_if { ::File.exist?(file) }
  end
end
