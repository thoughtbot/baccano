require_relative "./test_helper"
require "color"
require "avatar"

class AvatarTest < MiniTest::Test
  def avatar_class
    Avatar
  end

  def test_attributes
    avatar = avatar_class.new(
      body_color: "body_color",
      background_color: "background_color",
      skin_tone: "skin_tone",
      hair: "hair",
      eyes: "eyes",
      glasses: "glasses",
    )

    assert_equal avatar.body_color, "body_color"
    assert_equal avatar.background_color, "background_color"
    assert_equal avatar.skin_tone, "skin_tone"
    assert_equal avatar.hair, "hair"
    assert_equal avatar.eyes, "eyes"
    assert_equal avatar.glasses, "glasses"
  end

  def test_shadow
    avatar = avatar_class.new(
      body_color: "body_color",
      background_color: Color::RGB.new(255, 255, 255),
      skin_tone: "skin_tone",
      hair: "hair",
      eyes: "eyes",
      glasses: "glasses",
    )

    assert_equal avatar.shadow_color.hex, "b3b3b3"
  end

  def test_highlight
    avatar = avatar_class.new(
      body_color: Color::RGB.new(0, 0, 0),
      background_color: "background_color",
      skin_tone: "skin_tone",
      hair: "hair",
      eyes: "eyes",
      glasses: "glasses",
    )

    assert_equal avatar.body_highlight_color.hex, "4d4d4d"
  end
end
