# frozen_string_literal: true

module HexletCode
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
        if params.keys.any?
          "<#{tag} #{build_params(params)}>"
        else
          "<#{tag}>"
        end
      end
    end
  end
end
