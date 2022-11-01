# frozen_string_literal: true

module HexletCode
  class LabelNode
    attr_accessor :tag, :attrs, :content

    def initialize(attr)
      @tag = 'label'
      @attrs = { for: attr }
      @content = attr.to_s.capitalize
    end
  end
end
