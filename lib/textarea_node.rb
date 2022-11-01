# frozen_string_literal: true

module HexletCode
  class TextareaNode
    attr_accessor :tag, :attrs, :content

    def initialize(attr, obj, params)
      @tag = 'textarea'
      @attrs = {
        name: attr,
        cols: '20',
        rows: '40'
      }.merge(params.except(:as))
      @content = obj.public_send(attr.to_s)
    end
  end
end
