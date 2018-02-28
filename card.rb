class Card
  attr_reader :name, :scores

  def initialize(name, scores)
    @name = name
    @scores = scores
  end
end
