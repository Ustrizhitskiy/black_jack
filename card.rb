class Card
  attr_reader :name, :scores, :card

  def initialize(name, scores)
    @name = name
    @scores = scores
    @card = self.name
    print @card
  end
end
