class CardDeck
  CARD_VALUES = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze
  CARD_SUITS = %w[♠ ♥ ♣ ♦].freeze

  attr_reader :all_cards
  attr_accessor :scores

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

  def to_s
    @all_cards.inject do |str, card2|
      str.to_s + card2.name
    end
  end

  def each_card
    @all_cards.each { |card| yield(card) } if block_given?
  end

  def give_two_cards(participant)
    2.times { take_a_card(participant) }
  end

  def take_a_card(participant)
    card = @all_cards.sample
    participant.deck.all_cards << card
    @all_cards.delete(card)
  end

  def estimate_of_ace
    count = 0
    each_card do |card|
      count += 1 if card.scores == 11
    end
    @scores -= 10 if count == 1 && @scores > 21
    estimate_of_ace_continue(count)
  end

  def estimate_of_ace_continue(count)
    @scores -= 10 if count == 2 && @scores != 32
    @scores -= 20 if count == 2 && @scores == 32
    @scores -= 20 if count == 3
  end

  def show_all_scores_in_deck
    all_cards.inject(0) do |sum, card2|
      sum + card2.scores
    end
  end

  def game_scores(participant)
    puts "У #{participant.name}:"
    puts participant.deck
    @scores = show_all_scores_in_deck
    estimate_of_ace if @scores > 21
    puts "#{@scores} очков"
    puts '*****************************************************'
    @scores
  end

  def show_cards(participant)
    puts "Карты #{participant.name}"
    participant.deck.each_card do |card|
      if card.scores != 11
        puts "#{card.name} - #{card.scores} очков"
      else
        puts "#{card.name} - 1 или 11 очков"
      end
    end
  end
end
