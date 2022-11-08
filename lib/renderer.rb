# frozen_string_literal: true

module HexletCode
  class Renderer
    attr_accessor :tags, :html

    def initialize(obj, nodes)
      @obj = obj
      @tags = nodes
    end

    def render(params)
      Tag.build('form', { action: params.delete(:url) || '#', method: 'post' }.merge(params)) do
        tags.map do |f|
          if f.content.nil?
            Tag.build(f.tag, f.attrs)
          else
            Tag.build(f.tag, f.attrs) { f.content }
          end
        end.join
      end
    end
  end
end
