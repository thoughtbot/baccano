require "avatar"
require "color_picker"
require "fallback"
require "feature"

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
      skin_tone: skin_tone,
      body_size: body_size,
      eyes: eyes,
    )
  end

  def skin_tone
    ColorPicker.new(name: "skin_tones").color_from_file
  end

  def hair
    Feature.new(
      color: hair_color,
      partial: with_fallback(5) { attribute_partial("hair") },
    )
  end

  def glasses
    Feature.new(partial: with_fallback(60) { attribute_partial("glasses") })
  end

  def eyes
    Feature.new(partial: attribute_partial("eyes"))
  end

  def body_size
    rand(0.85...1.3)
  end

  private

  def hair_color
    Fallback.new(percentage: 20, fallback: ColorPicker.new.color).check do
      ColorPicker.new(name: "hair_colors").color_from_file
    end
  end

  def body_color_picker
    @body_color ||= ColorPicker.new
  end

  def attribute_partial(name)
    Dir.glob("./views/partials/#{name}/*.erb").map do |path|
      path.gsub("./views/", "").gsub(".erb", "").to_sym
    end.sample
  end

  def with_fallback(percentage, &block)
    Fallback.new(percentage: percentage).check(&block)
  end
end
