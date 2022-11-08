# frozen_string_literal: true

module HexletCode
  module Nodes
    class Label < Base
      def initialize(attr)
        super()

        @tag = 'label'
        @attrs = { for: attr }
        @content = attr.to_s.capitalize
      end
    end
  end
end
