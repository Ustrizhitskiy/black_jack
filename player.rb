class Player
  include MakeABet

  attr_reader :name, :bank, :cards, :scores

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @scores = 0
  end

  # получить две карты при первой раздаче
  def first_distribution(card_deck)

  end

  # принять карту
  def take_a_card(card)
    if @cards.size <= 2
      @cards << card
      @scores += card.scores.to_i
    end
  end

  # показать имеющтеся карты
  def show_cards
    @cards.each do |card|
      if card.scores != 11
        puts "#{card.name} - #{card.scores} очков"
      else
        puts "#{card.name} - 1 или 11 очков"
      end
    end
  end

  # пас
  def skip_move
  end
end
