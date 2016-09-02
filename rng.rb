require_relative 'avatar'
require 'color'
require 'color/rgb/contrast'

class Rng
  MINUMUM_CONTRAST = 0.4

  def initialize(seed = Random.new_seed)
    srand seed
  end

  def avatar
    body = color
    background = contrasting_color(color)
    Avatar.new(body, background, skin_tone, glasses)
  end

  def contrasting_color(other)
    attempt = color
    if other.contrast(attempt) > MINUMUM_CONTRAST
       attempt
    else
      contrasting_color(other)
    end
  end

  def color
    Color::RGB.new(channel, channel, channel)
  end

  def channel
    (0..255).to_a.sample
  end

  def skin_tone
    red, green, blue = YAML.load_file('skin_tones.yml')["skin_tones"].sample
    Color::RGB.new(red, green, blue)
  end

  def glasses
    percentage(60, "") { attribute_partial("glasses") }
  end


  private

  def percentage(odds, default)
    if (0...100).to_a.sample < odds
      default
    else
      yield
    end
  end

  def attribute_partial(name)
    Dir.glob("./views/partials/#{name}/*.erb").map do |path|
      path.gsub("./views/", "").gsub(".erb", "").to_sym
    end.sample
  end
end
