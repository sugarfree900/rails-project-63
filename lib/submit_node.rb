# frozen_string_literal: true

require 'minitest/autorun'

module HexletCode
  class SubmitNode
    attr_accessor :tag, :attrs, :content

    def initialize(value)
      @tag = 'input'
      @attrs = { type: 'submit', value: value || 'Save' }
      @content = nil
    end
  end
end
