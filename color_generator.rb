class ColorGenerator
  def body_color
    random_color
  end

  def body_detail_color
    random_color
  end

  private

  def random_color
    red_range = 0...255
    blue_range = 0...255
    green_range = 0...255

    [red_range, blue_range, green_range].map do |color_range|
      color_range.to_a.sample
    end.join(', ')
  end
end
