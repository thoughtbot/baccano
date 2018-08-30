class Avatar
  LIGHTING_CHANGE_AMOUNT = 70

  attr_reader(
    :background_color,
    :body_color,
    :body_size,
    :eyes,
    :glasses,
    :hair,
    :skin_tone,
  )

  def initialize(
    background_color:,
    body_color:,
    body_size:,
    eyes:,
    glasses:,
    hair:,
    skin_tone:
  )
    @background_color = background_color
    @body_color = body_color
    @body_size = body_size
    @eyes = eyes
    @glasses = glasses
    @hair = hair
    @skin_tone = skin_tone
  end

  def shadow_color
    background_color.darken_by(LIGHTING_CHANGE_AMOUNT)
  end

  def body_highlight_color
    body_color.lighten_by(LIGHTING_CHANGE_AMOUNT)
  end
end
