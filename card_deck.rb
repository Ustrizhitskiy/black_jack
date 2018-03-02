class CardDeck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = %w[♠ ♥ ♣ ♦].freeze

  attr_reader :all_cards
  attr_accessor :all_scores_in_deck#, :card

  def initialize
    @all_scores_in_deck = 0
    @all_cards = []
    create_new_deck
    self.show_all_scores_in_deck
  end

  def create_new_deck
    CARD_VALUES.each do |value|
      CARD_SUITS.each do |suit|
        scores = value if value.to_i.nonzero?
        scores = 10 if value.to_i.zero?
        scores = 11 if value == 'A'
        card = Card.new("#{value}#{suit}  ", scores)
        @all_cards << card
        @all_scores_in_deck += scores.to_i
      end
    end
    @all_cards.shuffle!
  end

  def show_all_scores_in_deck
    puts "\nВ колоде #{@all_scores_in_deck} (#{@all_scores_in_deck - 40}) очков."
  end

  def to_s
    puts 'Карты, не сыгравшие в этой игре:'
    @all_cards.each { |card| print card.name }
    puts
  end
end
