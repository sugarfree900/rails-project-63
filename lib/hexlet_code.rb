# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  autoload(:Tag, File.join(File.dirname(__FILE__), '/tag.rb'))
  autoload(:Renderer, File.join(File.dirname(__FILE__), '/renderer.rb'))
  autoload(:Nodes, File.join(File.dirname(__FILE__), '/nodes/nodes.rb'))
  autoload(:Form, File.join(File.dirname(__FILE__), '/form.rb'))

  def self.form_for(obj, params = {})
    form = Form.new(obj)
    yield form
    Renderer.new(obj, form.fields).render(params)
  end
end
