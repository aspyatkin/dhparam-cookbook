# dhparam-cookbook
Chef cookbook to create DH parameters files.

## Resources

### dhparam_file

Create a DH parameters file with the specified key length.

``` ruby
dhparam_file 'default' do
  key_length 2048
  action :create
end
```

## Helpers

``` ruby
# Get a full path to a specific DH parameters file
::ChefCookbook::DHParam.file(node, 'default')  # /etc/chef-dhparam/2048.pem
```

## License
MIT @ [Alexander Pyatkin](https://github.com/aspyatkin)
