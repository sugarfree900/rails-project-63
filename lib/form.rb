# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  class Form
    attr_accessor :obj, :fields

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      @fields.append(Nodes::Label.new(attr))
      @fields.append("HexletCode::Nodes::#{(params[:as] || 'input').capitalize}".constantize.new(attr, obj, params))
    end

    def submit(value = 'Save')
      @fields.append(Nodes::Submit.new(value))
    end
  end
end
