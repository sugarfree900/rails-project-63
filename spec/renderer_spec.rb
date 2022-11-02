# frozen_string_literal: true

require_relative '../lib/hexlet_code'

require_relative './support/spec_helpers'

RSpec.configure do |c|
  c.include SpecHelpers
end

describe HexletCode::Renderer do
  describe 'form' do
    context 'is' do
      let(:user) { HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm' }

      it 'test_empty' do |example|
        expect(HexletCode.form_for(user) { '' }).to eq(get_fixture(example.description))
      end

      it 'test_users_url' do |example|
        expect(HexletCode.form_for(user, url: '/users') { '' }).to eq(get_fixture(example.description))
      end

      it 'test_with_inputs' do |example|
        expect(HexletCode.form_for(user, url: '/users', method: 'patch') do |f|
          # Проверяет есть ли значение внутри name
          f.input :name
          # Проверяет есть ли значение внутри job
          f.input :job, as: :text
          f.submit 'Wow'
        end).to eq(get_fixture(example.description))
      end

      it 'test_with_inputs_with_attrs' do |example|
        expect(HexletCode.form_for(user, url: '#') do |f|
          f.input :name, class: 'user-input'
          f.input :job
          f.submit
        end).to eq(get_fixture(example.description))
      end
    end
  end
end

describe HexletCode::Renderer do
  describe 'form with textarea' do
    context 'is' do
      let(:user) { HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm' }

      it 'test_with_inputs_with_default_values' do |example|
        expect(HexletCode.form_for(user) do |f|
          f.input :job, as: :text
        end).to eq(get_fixture(example.description))
      end

      it 'test_with_inputs_with_custom_values' do |example|
        expect(HexletCode.form_for(user, url: '#') do |f|
          f.input :job, as: :text, rows: 50, cols: 50
        end).to eq(get_fixture(example.description))
      end
    end
  end
end

describe HexletCode::Renderer do
  describe 'form with error' do
    context 'is' do
      let(:user) { HexletCode::User.new name: 'rob', job: 'hexlet', gender: 'm' }

      it 'test_error_for_undefined_field' do
        expect do
          HexletCode.form_for user, url: '/users' do |f|
            f.input :name
            f.input :job, as: :text
            # Поля age у пользователя нет
            f.input :age
          end
        end.to raise_error(NoMethodError)
      end
    end
  end
end
