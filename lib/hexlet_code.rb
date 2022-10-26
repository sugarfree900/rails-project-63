# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'minitest/autorun'

module HexletCode
  class Error < StandardError; end

  User = Struct.new(:name, :job, keyword_init: true)

  autoload(:Tag, './lib/tag.rb')

  def self.form_for(_, params = {})
    action = params[:url] || '#'
    "<form action=\"#{action}\" method=\"post\"></form>"
  end
end
