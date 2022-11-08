# frozen_string_literal: true

module HexletCode
  module Nodes
    class Text < BaseInput
      def initialize(attr, obj, params)
        super()

        @tag = 'textarea'
        @attrs = {
          name: attr,
          cols: '20',
          rows: '40'
        }.merge(params.except(:as))
        @content = get_attr_value(obj, attr.to_s)
      end
    end
  end
end
