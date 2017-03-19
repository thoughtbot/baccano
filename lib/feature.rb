class Feature
  attr_reader :partial, :color

  def initialize(partial:, color: nil)
    @color = color
    @partial = partial
  end

  def supplemental_partial
    if supplemental_partial_exists?
      supplemental_partial_path.to_sym
    else
      ""
    end
  end

  private

  def partial_string
    partial.to_s
  end

  def supplemental_partial_path
    File.join(directory, "background", name)
  end

  def supplemental_partial_exists?
    File.exists?(supplemental_full_path)
  end

  def supplemental_full_path
    File.expand_path(File.join("views", supplemental_partial_path) + ".erb")
  end

  def name
    partial_string.split("/").last || ""
  end

  def directory
    partial_string.gsub("/#{name}", "").to_s || ""
  end
end
