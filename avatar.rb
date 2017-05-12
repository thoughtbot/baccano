class Avatar
  attr_reader :body_color, :hair, :hair_color, :background_color, :skin_tone, :glasses, :hair_background, :eyes


  def initialize(body_color, background_color, skin_tone, hair, hair_color, glasses, hair_background, eyes)
    @body_color = body_color
    @background_color = background_color
    @skin_tone = skin_tone
    @hair = hair
    @hair_color = hair_color
    @glasses = glasses
    @hair_background = hair_background
    @eyes = eyes
  end

  def shadow_color
    background_color.darken_by(70)
  end

  def body_highlight_color
    body_color.lighten_by(70)
  end
end
