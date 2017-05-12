class Avatar
  attr_reader :body_color, :hair, :background_color, :skin_tone, :glasses, :eyes, :body_size

  def initialize(
    background_color:,
    body_color:,
    eyes:,
    glasses:,
    hair:,
    body_size:,
    skin_tone:
  )
    @background_color = background_color
    @body_color = body_color
    @eyes = eyes
    @glasses = glasses
    @hair = hair
    @skin_tone = skin_tone
    @body_size = body_size
  end

  def shadow_color
    background_color.darken_by(70)
  end

  def body_highlight_color
    body_color.lighten_by(70)
  end
end
