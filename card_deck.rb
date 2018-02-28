class CardDeck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = %w[♠ ♥ ♣ ♦].freeze

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
        # puts "#{card.name} - #{card.scores}"
      end
    end
  end
end
