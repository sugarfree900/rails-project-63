# frozen_string_literal: true

module HexletCode
  class Form
    attr_accessor :obj, :fields

    def initialize(obj)
      @obj = obj
      @fields = []
    end

    def input(attr, params = {})
      @fields.append(LabelNode.new(attr))
      if params[:as]
        @fields.append(TextareaNode.new(attr, obj, params))
      else
        @fields.append(InputNode.new(attr, obj, params))
      end
    end

    def submit(value = 'Save')
      @fields.append(SubmitNode.new(value))
    end

    def execute
      yield self
    end
  end
end
