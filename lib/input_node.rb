# frozen_string_literal: true

require 'minitest/autorun'

module HexletCode
  class InputNode
    attr_accessor :tag, :attrs, :content

    def initialize(attr, obj, params)
      @tag = 'input'
      @attrs = {
        name: attr,
        type: 'text',
        value: obj.public_send(attr.to_s)
      }.merge(params)
      @content = nil
    end
  end
end
