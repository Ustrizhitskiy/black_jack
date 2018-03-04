class Card
  attr_reader :name, :scores

  def initialize(name, scores)
    @name = name
    @scores = scores.to_i
  end

  def to_s
    @name.to_s
  end
end
