require 'minitest/autorun'
require File.expand_path '../color_generator.rb', __FILE__

class TestColorGenerator < MiniTest::Unit::TestCase
  def test_that_body_color_returns_random
    generator = ColorGenerator.new

    first_body_color = generator.body_color
    second_body_color = generator.body_color

    refute_equal first_body_color, second_body_color
  end

  def test_that_body_detail_color_returns_random
    generator = ColorGenerator.new

    first_body_detail_color = generator.body_detail_color
    second_body_detail_color = generator.body_detail_color

    refute_equal first_body_detail_color, second_body_detail_color
  end
end
