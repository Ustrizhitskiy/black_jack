class Player
  include MakeABet

  attr_reader :name, :bank
  attr_accessor :scores, :cards

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @scores = 0
  end

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

  def show_cards
    @cards.each do |card|
      if card.scores != 11
        puts "#{card.name} - #{card.scores} очков"
      else
        puts "#{card.name} - 1 или 11 очков"
      end
    end
  end

  def game_scores
    puts 'Ваши карты:'
    @cards.each do |card|
      puts card.name.to_s
    end
    estimate_of_ace if @scores > 21
    name = @name
    puts "#{name}, у Вас #{@scores} очков"
    puts '*****************************************************'
    @scores
  end
end
