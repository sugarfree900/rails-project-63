# frozen_string_literal: true

require_relative '../lib/tag'

class TagTest < Minitest::Test
  def test_br
    assert HexletCode::Tag.build('br') == '<br>'
  end

  def test_img
    assert HexletCode::Tag.build('img', src: 'path/to/image') == '<img src="path/to/image">'
  end

  def test_input
    assert HexletCode::Tag.build('input', type: 'submit', value: 'Save') == '<input type="submit" value="Save">'
  end

  def test_label
    assert HexletCode::Tag.build('label') { 'Email' } == '<label>Email</label>'
  end

  def test_label_attrs
    assert HexletCode::Tag.build('label', for: 'email') { 'Email' } == '<label for="email">Email</label>'
  end

  def test_div
    assert HexletCode::Tag.build('div') {} == '<div></div>'
  end
end
