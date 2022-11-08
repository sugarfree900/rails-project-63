# frozen_string_literal: true

module HexletCode
  module Nodes
    autoload(:Base, File.join(File.dirname(__FILE__), '/base.rb'))
    autoload(:BaseInput, File.join(File.dirname(__FILE__), '/base_input.rb'))
    autoload(:Label, File.join(File.dirname(__FILE__), '/label.rb'))
    autoload(:Text, File.join(File.dirname(__FILE__), '/text.rb'))
    autoload(:Input, File.join(File.dirname(__FILE__), '/input.rb'))
    autoload(:Submit, File.join(File.dirname(__FILE__), '/submit.rb'))
  end
end
