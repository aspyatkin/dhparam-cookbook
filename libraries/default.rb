class Chef
  class Exceptions
    class DHParamFileNotFoundError < RuntimeError
    end
  end
end

module ChefCookbook
  module DHParam
    def self.init(node)
      unless node.run_state.key?('dhparam')
        node.run_state['dhparam'] = {}
      end
    end

    def self.add(node, name, path)
      init(node)
      node.run_state['dhparam'][name] = path
    end

    def self.file(node, name)
      init(node)
      unless node.run_state['dhparam'].key?(name)
        raise ::Chef::Exceptions::DHParamFileNotFoundError,
              "A dhparam file not found by the name '#{name}'!"
      end
      node.run_state['dhparam'][name]
    end
  end
end
