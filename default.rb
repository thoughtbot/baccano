class Default
  def initialize(percentage: 100, default: "")
    @percentage = percentage
    @default = default
  end

  def check
    if (0..100).to_a.sample < percentage
      default
    else
      yield
    end
  end

  private

  attr_reader :percentage, :default
end
