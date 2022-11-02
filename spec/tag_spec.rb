# frozen_string_literal: true

require_relative '../lib/tag'

require_relative './support/spec_helpers'

RSpec.configure do |c|
  c.include SpecHelpers
end

describe HexletCode::Tag do
  describe 'tag' do
    context 'is' do
      it 'br' do
        expect(HexletCode::Tag.build('br')).to eq('<br>')
      end

      it 'img' do
        expect(HexletCode::Tag.build('img', src: 'path/to/image')).to eq('<img src="path/to/image">')
      end

      it 'input' do
        expect(HexletCode::Tag.build('input', type: 'submit',
                                              value: 'Save')).to eq('<input type="submit" value="Save">')
      end

      it 'label' do
        expect(HexletCode::Tag.build('label') { 'Email' }).to eq('<label>Email</label>')
      end

      it 'label with attrs' do
        expect(HexletCode::Tag.build('label', for: 'email') { 'Email' }).to eq('<label for="email">Email</label>')
      end

      it 'div' do
        expect(HexletCode::Tag.build('div') {}).to eq('<div></div>')
      end
    end
  end
end
