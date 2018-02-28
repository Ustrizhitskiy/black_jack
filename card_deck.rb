class CardDeck
  CARD_VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
  CARD_SUITS = %w(♠ ♥ ♣ ♦)

  attr_reader :all_cards

  def initialize
    @all_cards = []
    create_new_deck
  end

  def create_new_deck
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        scores = value if value.to_i.nonzero?
        scores = 10 if value.to_i.zero?
        scores = 11 if value == 'A'
        card = Card.new("#{value}#{suit}", scores)
        @all_cards << card
        #puts "#{card.name} - #{card.scores}"
      end
    end
  end

  def give_a_card(card)
    rand(@cards)
  end
end

#deck = CardDeck.new
