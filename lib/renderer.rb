# frozen_string_literal: true

require 'minitest/autorun'

module HexletCode
  class Renderer
    attr_accessor :tags, :html

    def initialize(obj, nodes)
      @obj = obj
      @tags = nodes
    end

    def render(params)
      Tag.build('form', action: params[:url] || '#', method: params[:method] || 'post') do
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
