require "color"
require "color/rgb/contrast"

class ColorPicker
  MINUMUM_CONTRAST = 0.4

  def initialize(name: nil)
    @name = name
  end

  def color_contrast
    @color_contrast ||= generate_contrasting_color
  end

  def color
    @color ||= generate_random_color
  end

  def color_from_file
    @color_from_file ||= Color::RGB.new(*sample_from_file)
  end

  private

  attr_reader :name

  def channel
    (0..255).to_a.sample
  end

  def sample_from_file
    YAML.load_file("#{name}.yml")[name].sample
  end

  def generate_random_color
    Color::RGB.new(channel, channel, channel)
  end

  def generate_contrasting_color
    random_color = generate_random_color
    if color.contrast(random_color) > MINUMUM_CONTRAST
      random_color
    else
      generate_contrasting_color
    end
  end
end
