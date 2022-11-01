# frozen_string_literal: true

require_relative '../lib/hexlet_code'

class RendererTest < Minitest::Test
  def setup
    @user = HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm'
    @setup ||= Dir['spec/fixtures/*'].map { |f| [File.basename(f, '.html'), File.read(f)] }.to_h
  end

  def test_empty
    assert_equals_fixture HexletCode.form_for(@user) { |_| }
  end

  def test_users_url
    assert_equals_fixture HexletCode.form_for(@user, url: '/users') { |_| }
  end

  def test_with_inputs
    assert_equals_fixture(HexletCode.form_for(@user, url: '/users', method: 'patch') do |f|
      # Проверяет есть ли значение внутри name
      f.input :name
      # Проверяет есть ли значение внутри job
      f.input :job, as: :text
      f.submit 'Wow'
    end)
  end

  # добавил в фикстуру value="hexlet" для атрибута job (тк значение у нас есть!)
  def test_with_inputs_with_attrs
    assert_equals_fixture(HexletCode.form_for(@user, url: '#') do |f|
      f.input :name, class: 'user-input'
      f.input :job
      f.submit
    end)
  end

  def test_with_inputs_with_default_values
    assert_equals_fixture(HexletCode.form_for(@user) do |f|
      f.input :job, as: :text
    end)
  end

  # изменил порядок атрибутов на тот, который прописан в дефолтах, тк в ruby порядок гарантируется хешем
  def test_with_inputs_with_custom_values
    assert_equals_fixture(HexletCode.form_for(@user, url: '#') do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end)
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

  def assert_equals_fixture(html)
    assert html == @setup[name]
  end
end
