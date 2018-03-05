class Diler < Paripicipant
  def initialize(name = 'Diler')
    super(name)
  end

  def view_card
    puts '**'
  end

  def scores_not_enough
    count = 0
    scores = 0
    @deck.each_card do |card|
      count += 1 if card.scores == 11
    end
    scores = 12 if count == 2
    scores
  end
end
