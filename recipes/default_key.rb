helper = ::ChefCookbook::DHParam.new(node)

if helper.default_key?
  dhparam_key helper.default_key_size.to_s do
    action :create
  end
end
