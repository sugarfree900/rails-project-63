# frozen_string_literal: true

module HexletCode
  module Nodes
    class BaseInput < Base
      def get_attr_value(obj, attr)
        obj.public_send(attr.to_s)
      end
    end
  end
end
