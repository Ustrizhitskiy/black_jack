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
    j = 52
    get_two_cards(card_deck, j)
    puts "*************************************************\nВаши карты:\n\n"
    @cards.each { |card| puts view_card(card).to_s }
    show_cards
    card_deck
  end

  def view_card(card)
    puts "* * * * *
        \r*       *
        \r*       *
        \r*  #{card.name}   *
        \r*       *
        \r*       *
        \r* * * * *"
  end

  # принять карту
  def take_a_card(card)
    if @cards.size <= 2
      @cards << card
      @scores += card.scores.to_i
    end
  end

  # показать имеющиеся карты
  def show_cards
    @cards.each do |card|
      if card.scores != 11
        puts "#{card.name} - #{card.scores} очков"
      else
        puts "#{card.name} - 1 или 11 очков"
      end
    end
  end

  # показать карты в конце игры
  def game_scores
    puts 'Ваши карты:'
    @cards.each do |card|
      puts "#{card.name}"
    end
    puts "У Вас #{@scores} очков" if @scores <= 21
  end

  def estimate_of_ace
  end

  # пас
  def skip_move
  end
end
