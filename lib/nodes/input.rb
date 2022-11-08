# frozen_string_literal: true

module HexletCode
  module Nodes
    class Input < BaseInput
      def initialize(attr, obj, params)
        super()

        @tag = 'input'
        @attrs = {
          name: attr,
          type: 'text',
          value: get_attr_value(obj, attr.to_s)
        }.merge(params)
        @content = nil
      end
    end
  end
end
