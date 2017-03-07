module ChefCookbook
  class DHParam
    def initialize(node)
      @id = 'dhparam'
      @node = node
    end

    def base_dir
      @node[@id]['base_dir']
    end

    def key_file(key_size)
      ::File.join(base_dir, "dhparam_#{key_size}")
    end

    def default_key_size
      @node[@id].fetch('default_key_size', nil)
    end

    def default_key?
      not default_key_size.nil?
    end

    def default_key_file
      default_key? ? key_file(default_key_size) : nil
    end
  end
end
