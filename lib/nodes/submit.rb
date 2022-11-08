# frozen_string_literal: true

module HexletCode
  module Nodes
    class Submit < Base
      def initialize(value)
        super()

        @tag = 'input'
        @attrs = { type: 'submit', value: value || 'Save' }
        @content = nil
      end
    end
  end
end
