ENV["RACK_ENV"] = "test"
require "minitest/autorun"

require "color"
require File.expand_path "../../avatar.rb", __FILE__

class AvatarTest < MiniTest::Test
  def avatar_class
    Avatar
  end

  def test_attributes
    avatar = avatar_class.new(
      "body_color",
      "background_color",
      "skin_tone",
      "hair",
      "hair_color",
      "glasses",
      "hair_bg",
    )

    assert_equal avatar.body_color, "body_color"
    assert_equal avatar.background_color, "background_color"
    assert_equal avatar.skin_tone, "skin_tone"
    assert_equal avatar.hair, "hair"
    assert_equal avatar.hair_color, "hair_color"
    assert_equal avatar.glasses, "glasses"
    assert_equal avatar.hair_background, "hair_bg"
  end

  def test_shadow
    avatar = avatar_class.new(
      "body_color",
      Color::RGB.new(255, 255, 255),
      "skin_tone",
      "hair",
      "hair_color",
      "glasses",
      "hair_bg",
    )

    assert_equal avatar.shadow_color.hex, "b3b3b3"
  end

  def test_highlight
    avatar = avatar_class.new(
      Color::RGB.new(0, 0, 0),
      "background_color",
      "skin_tone",
      "hair",
      "hair_color",
      "glasses",
      "hair_bg",
    )

    assert_equal avatar.body_highlight_color.hex, "4d4d4d"
  end
end
