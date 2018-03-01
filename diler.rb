class Diler
  include MakeABet
  attr_reader :bank, :cards, :scores

  def initialize
    @bank = 100
    @cards = []
    @scores = 0
  end

  # получить две карты при первой раздаче
  def first_distribution(card_deck_reduced)
    j = 50
    get_two_cards(card_deck_reduced, j)
    puts "*************************************************\nКарты дилера:\n"
    @cards.each { view_card }
    #@cards.each { |card| puts view_card(card).to_s }
    #show_cards
    card_deck_reduced
  end

  def view_card
    puts "* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *\n\n"
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
    puts 'Карты дилера:'
    @cards.each do |card|
      puts "#{card.name} - #{card.scores} очков"
    end
    puts "У дилера #{@scores} очков"
  end

  # пропустить ход (если очков 17 и более)
  def skip_move
  end
end
