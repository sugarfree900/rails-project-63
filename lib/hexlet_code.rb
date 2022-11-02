# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end

  User = Struct.new(:name, :job, :gender, keyword_init: true)

  autoload(:Tag, File.join(File.dirname(__FILE__), '/tag.rb'))
  autoload(:Renderer, File.join(File.dirname(__FILE__), '/renderer.rb'))
  autoload(:Form, File.join(File.dirname(__FILE__), '/form.rb'))
  autoload(:LabelNode, File.join(File.dirname(__FILE__), '/label_node.rb'))
  autoload(:TextareaNode, File.join(File.dirname(__FILE__), '/textarea_node.rb'))
  autoload(:InputNode, File.join(File.dirname(__FILE__), '/input_node.rb'))
  autoload(:SubmitNode, File.join(File.dirname(__FILE__), '/submit_node.rb'))

  def self.form_for(user, params = {}, &block)
    form = Form.new(user)
    form.execute(&block)
    Renderer.new(user, form.fields).render(params)
  end
end
