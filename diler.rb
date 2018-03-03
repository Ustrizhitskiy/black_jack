class Diler < Paripicipant
  def initialize(name = 'Diler')
    super(name)
  end

  def first_distribution(card_deck_reduced)
    get_two_cards(card_deck_reduced)
    puts "*************************************************\nКарты #{@name}:\n"
    @deck.all_cards.each { view_card }
    card_deck_reduced
  end

  def view_card
    puts "**\n\n"
  end

  def scores_not_enough
    count = 0
    scores = 0
    @deck.all_cards.each do |card|
      count += 1 if card.scores == 11
    end
    scores = 12 if count == 2
    scores
  end
end
