class Player < Paripicipant
  def first_distribution(card_deck)
    get_two_cards(card_deck)
    puts "*************************************************\nКарты #{@name}:\n\n"
    @deck.all_cards.each { |card| puts card.to_s }
    show_cards
    card_deck
  end

  def view_card(card)
    puts card.to_s
  end
end
