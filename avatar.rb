class Avatar
  attr_reader :body_color, :background_color, :skin_tone, :glasses

  def initialize(body_color, background_color, skin_tone, glasses)
    @body_color = body_color
    @background_color = background_color
    @skin_tone = skin_tone
    @glasses = glasses
  end

  def shadow_color
    background_color.darken_by(70)
  end

  def body_highlight_color
    body_color.lighten_by(70)
  end
end
