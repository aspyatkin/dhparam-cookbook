# dhparam-cookbook
Chef cookbook to create dhparam files for [nginx](http://nginx.org/) web server.

## Attributes

`node['dhparam']['default_key_size']` -- This attribute is used in `dhparam::default_key` recipe so as to create a default key. By default, this value is `nil` (no default key is to be created).

## Recipes

### dhparam::default_key

Create a default key of size specified in `node['dhparam']['default_key_size']` attribute.

## Resources

### dhparam_key

Create a key of specific size.

``` ruby
dhparam_key '2048' do
  action :create
end
```

## Helpers

``` ruby
dhparam = ::ChefCookbook::DHParam.new(node)

dhparam.key_file(2048)  # Get path to the 2048-bit dhparam file

dhparam.default_key_size  # Get the default key size, if specified by the corresponding attribute
dhparam.default_key?  # Whether or not the default key size is specified
dhparam.default_key_file  # Get path to the default key file
```

## License
MIT @ [Alexander Pyatkin](https://github.com/aspyatkin)
