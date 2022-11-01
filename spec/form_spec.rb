# frozen_string_literal: true

require_relative '../lib/hexlet_code'

class FormTest < Minitest::Test
  def setup
    @user = HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm'
  end

  def test_empty
    assert HexletCode.form_for(@user) { |_| } == '<form action="#" method="post"></form>'
  end

  def test_users_url
    assert HexletCode.form_for(@user, url: '/users') { |_|
    } == '<form action="/users" method="post"></form>'
  end

  def test_with_inputs
    result = HexletCode.form_for @user do |f|
      # Проверяет есть ли значение внутри name
      f.input :name
      # Проверяет есть ли значение внутри job
      f.input :job, as: :text
      f.submit 'Wow'
    end
    assert result == '<form action="#" method="post"><label for="name"></label>' \
                     '<input name="name" type="text" value="rob"><label for="job"></label><textarea name="job" ' \
                     'cols="20" rows="40">hexlet</textarea><input type="submit" value="Wow"></form>'
  end

  # добавил в фикстуру value="hexlet" для атрибута job (тк значение у нас есть!)
  def test_with_inputs_with_attrs
    result = HexletCode.form_for @user, url: '#' do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end
    assert result == '<form action="#" method="post"><label for="name"></label>' \
                     '<input name="name" type="text" value="rob" class="user-input">' \
                     '<label for="job"></label><input name="job" type="text" value="hexlet">' \
                     '<input type="submit" value="Save"></form>'
  end

  def test_with_inputs_with_default_values
    result = HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end
    assert result == '<form action="#" method="post"><label for="job"></label><textarea name="job" cols="20" rows="40">hexlet</textarea></form>'
  end

  # изменил порядок атрибутов на тот, который прописан в дефолтах, тк в ruby порядок гарантируется хешем
  def test_with_inputs_with_custom_values
    result = HexletCode.form_for @user, url: '#' do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end
    assert result == '<form action="#" method="post"><label for="job"></label><textarea name="job" cols="50" rows="50">hexlet</textarea></form>'
  end

  def test_error_for_undefined_field
    assert_raises NoMethodError do
      HexletCode.form_for @user, url: '/users' do |f|
        f.input :name
        f.input :job, as: :text
        # Поля age у пользователя нет
        f.input :age
      end
    end
  end
end
