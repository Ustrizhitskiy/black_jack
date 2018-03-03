class CardDeck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = %w[♠ ♥ ♣ ♦].freeze

  attr_reader :all_cards

  def initialize
    @all_cards = []
  end

  def create_new_deck
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        scores = value if value.to_i.nonzero?
        scores = 10 if value.to_i.zero?
        scores = 11 if value == 'A'
        card = Card.new("#{value}#{suit}  ", scores)
        @all_cards << card
      end
    end
    @all_cards.shuffle!
    self
  end

  def show_all_scores_in_deck
    @all_cards.inject(0) do |sum, card2|
      sum + card2.scores.to_i
    end
  end

  def to_s
    str = String.new
    @all_cards.each { |card, index| str += card.name.to_s }
    "Карты в колоде: \n\r#{str}"
  end
end
