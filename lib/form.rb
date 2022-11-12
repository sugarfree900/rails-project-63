# frozen_string_literal: true

module HexletCode
  class Form
    attr_accessor :obj, :fields

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      @fields.append(Nodes::Label.new(attr))
      @fields.append(node_module(params[:as]).new(attr, obj, params))
    end

    def submit(value = 'Save')
      @fields.append(Nodes::Submit.new(value))
    end

    private

    def node_string(as)
      "HexletCode::Nodes::#{(as || 'input').capitalize}"
    end

    def node_module(as)
      Object.const_get(node_string(as))
    end
  end
end
