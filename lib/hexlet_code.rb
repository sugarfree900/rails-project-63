# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'minitest/autorun'

module HexletCode
  class Error < StandardError; end

  User = Struct.new(:name, :job, :gender, keyword_init: true) do
    def initialize(params)
      @form_value = ''
      super(params)
    end

    def input(attr, params = {})
      @form_value += label_tag(attr)
      @form_value += case params[:as]
                     when :text
                       textarea_tag(attr, params)
                     else
                       default_tag(attr, params)
                     end
    end

    def submit(value = 'Save')
      @form_value += Tag.build('input', {type: 'submit', value: value})
    end

    def form_value
      @form_value
    end

    private

    def textarea_tag(attr, params)
      Tag.build('textarea', {
        name: attr,
        cols: '20',
        rows: '40'
      }.merge(params.except(:as))) do
        public_send(attr.to_s)
      end
    end

    def default_tag(attr, params)
      Tag.build('input', {
        name: attr,
        type: 'text',
        value: public_send(attr.to_s)
      }.merge(params))
    end

    def label_tag(attr)
      Tag.build('label', {for: attr}) { attr.to_s.capitalize }
    end
  end

  autoload(:Tag, './lib/tag.rb')

  def self.form_for(user, params = {})
    Tag.build('form', action: params[:url] || '#', method: params[:method] || 'post') do
      yield user
      user.form_value
    end
  end
end
