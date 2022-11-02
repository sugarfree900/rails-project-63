# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  autoload(:Tag, './lib/tag.rb')
  autoload(:Renderer, './lib/renderer.rb')
  autoload(:Form, './lib/form.rb')
  autoload(:LabelNode, './lib/label_node.rb')
  autoload(:TextareaNode, './lib/textarea_node.rb')
  autoload(:InputNode, './lib/input_node.rb')
  autoload(:SubmitNode, './lib/submit_node.rb')

  def self.form_for(user, params = {}, &block)
    autoload(:Form, './lib/form.rb')
    form = Form.new(user)
    form.execute(&block)
    Renderer.new(user, form.fields).render(params)
  end
end
