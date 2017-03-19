class Fallback
  def initialize(percentage:, fallback: "")
    @percentage = percentage
    @fallback = fallback
  end

  def check
    if (0..100).to_a.sample < percentage
      fallback
    else
      yield
    end
  end

  private

  attr_reader :percentage, :fallback
end
