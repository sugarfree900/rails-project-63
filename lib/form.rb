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
      @fields.append(Object.const_get("HexletCode::Nodes::#{(params[:as] || 'input').capitalize}").new(attr, obj,
                                                                                                       params))
    end

    def submit(value = 'Save')
      @fields.append(Nodes::Submit.new(value))
    end
  end
end
