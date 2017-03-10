require_relative "avatar"
require_relative "color_picker"
require_relative "default"

class Rng
  def initialize(seed = Random.new_seed)
    srand seed
  end

  def avatar
    Avatar.new(
      background_color: body_color_picker.color_contrast,
      body_color: body_color_picker.color,
      glasses: glasses,
      hair: hair,
      hair_background: hair_background,
      hair_color: hair_color,
      skin_tone: skin_tone,
      eyes: eyes,
    )
  end

  def skin_tone
    ColorPicker.new(name: "skin_tones").color_from_file
  end

  def hair_background
    new_hair = hair.to_s

    new_hair.gsub("/hair/", "/background_hair/").to_sym
  end

  def hair
    @_hair ||= Default.new(percentage: 5).check { attribute_partial("hair") }
  end

  def hair_color
    Default.new(percentage: 20, default: ColorPicker.new.color).check do
      ColorPicker.new(name: "hair_colors").color_from_file
    end
  end

  def glasses
    Default.new(percentage: 60).check { attribute_partial("glasses") }
  end

  def eyes
    attribute_partial("eyes")
  end

  private

  def body_color_picker
    @body_color ||= ColorPicker.new
  end

  def attribute_partial(name)
    Dir.glob("./views/partials/#{name}/*.erb").map do |path|
      path.gsub("./views/", "").gsub(".erb", "").to_sym
    end.sample
  end
end
