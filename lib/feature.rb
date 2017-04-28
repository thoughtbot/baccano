class Feature
  attr_reader :partial, :color

  def initialize(partial:, color: nil, views: "./views")
    @color = color
    @partial = partial
    @views = views
  end

  def supplemental_partial
    if supplemental_partial_exists?
      supplemental_partial_path.to_sym
    else
      ""
    end
  end

  private

  attr_reader :views

  def partial_string
    partial.to_s
  end

  def supplemental_partial_path
    File.join(directory, "background", name)
  end

  def supplemental_partial_exists?
    File.exist?(supplemental_full_path)
  end

  def supplemental_full_path
    File.expand_path(File.join(views, supplemental_partial_path) + ".erb")
  end

  def name
    partial_string.split("/").last || ""
  end

  def directory
    partial_string.gsub("/#{name}", "").to_s || ""
  end
end
