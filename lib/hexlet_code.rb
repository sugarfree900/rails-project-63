# frozen_string_literal: true

require_relative 'hexlet_code/version'
require 'minitest/autorun'

module HexletCode
  class Error < StandardError; end

  class Tag
    class << self
      def build(tag, params = {})
        if block_given?
          "#{build_opening_tag(tag, params)}#{yield}</#{tag}>"
        else
          build_opening_tag(tag, params)
        end
      end

      private

      def build_params(params)
        params.to_a.map { |pair| "#{pair.first}=\"#{pair.last}\"" }.join(' ')
      end

      def build_opening_tag(tag, params)
        if params.keys.length.positive?
          "<#{tag} #{build_params(params)}>"
        else
          "<#{tag}>"
        end
      end
    end
  end

  class TagTest < Minitest::Test
    def test_br
      assert Tag.build('br') == '<br>'
    end

    def test_img
      assert Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">'
    end

    def test_input
      assert Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">'
    end

    def test_label
      assert Tag.build('label') { 'Email' } == '<label>Email</label>'
    end

    def test_label_attrs
      assert Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>'
    end

    def test_div
      assert Tag.build('div') {} == '<div></div>'
    end
  end
end
