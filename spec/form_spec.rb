# frozen_string_literal: true

require_relative '../lib/hexlet_code'

class FormTest < Minitest::Test
  def setup
    @user = HexletCode::User.new(name: 'rob')
  end

  def test_empty
    assert HexletCode.form_for(@user) { |_| } == '<form action="#" method="post"></form>'
  end

  def test_users_url
    assert HexletCode.form_for(@user, url: '/users') { |_|
    } == '<form action="/users" method="post"></form>'
  end
end
