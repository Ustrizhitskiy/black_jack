class Card
  attr_reader :name, :scores

  def initialize(name, scores)
    @name = name
    @scores = scores
  end

  def to_s
    str = String.new + @name.to_s
  end
end
