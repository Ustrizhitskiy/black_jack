class CardDeck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = %w[♠ ♥ ♣ ♦].freeze

  attr_reader :all_cards

  def initialize
    @all_cards = []
  end

  def fill_deck
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        scores = value if value.to_i.nonzero?
        scores = 10 if value.to_i.zero?
        scores = 11 if value == 'A'
        card = Card.new("#{value}#{suit}  ", scores)
        @all_cards << card
      end
    end
    self
  end

  def show_all_scores_in_deck
    @all_cards.inject(0) do |sum, card2|
      sum + card2.scores
    end
  end

  def to_s
    str = ''
    each_card do |card|
      str += card.name
    end
    "Карты в колоде: \n\r#{str}"
  end

  def each_card
    @all_cards.each { |card| yield(card) } if block_given?
  end

  def get_two_cards(participant)
    2.times { take_a_card(participant) }
  end

  def take_a_card(participant)
    card = @all_cards.sample
    participant.deck.all_cards << card
    @all_cards.delete(card)
  end
end
