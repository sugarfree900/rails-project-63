# frozen_string_literal: true

module SpecHelpers
  def get_fixture(name)
    File.read(Dir['spec/fixtures/*'].find { |f| File.basename(f, '.html') == name })
  end
end
