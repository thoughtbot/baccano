require_relative "./test_helper"
require "color"
require "avatar"

class AvatarTest < MiniTest::Test
  def avatar_class
    Avatar
  end

  def setup
    @simple_avatar = avatar_class.new(
      body_color: "body_color",
      background_color: "background_color",
      skin_tone: "skin_tone",
      hair: "hair",
      eyes: "eyes",
      body_size: "body_size",
      glasses: "glasses",
    )
  end

  def test_attributes_body_color
    assert_equal @simple_avatar.body_color, "body_color"
  end

  def test_attributes_background_color
    assert_equal @simple_avatar.background_color, "background_color"
  end

  def test_attributes_skin_tone
    assert_equal @simple_avatar.skin_tone, "skin_tone"
  end

  def test_attributes_hair
    assert_equal @simple_avatar.hair, "hair"
  end

  def test_attributes_eyes
    assert_equal @simple_avatar.eyes, "eyes"
  end

  def test_attributes_glasses
    assert_equal @simple_avatar.glasses, "glasses"
  end

  def test_shadow
    avatar = avatar_class.new(
      body_color: "body_color",
      background_color: Color::RGB.new(255, 255, 255),
      skin_tone: "skin_tone",
      hair: "hair",
      eyes: "eyes",
      body_size: "body_size",
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
      body_size: "body_size",
      glasses: "glasses",
    )

    assert_equal avatar.body_highlight_color.hex, "4d4d4d"
  end
end
