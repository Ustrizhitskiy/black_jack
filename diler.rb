class Diler
  include MakeABet

  attr_reader :bank
  attr_accessor :scores, :cards

  def initialize
    @bank = 100
    @cards = []
    @scores = 0
  end

  def first_distribution(card_deck_reduced)
    j = 50
    get_two_cards(card_deck_reduced, j)
    puts "*************************************************\nКарты дилера:\n"
    @cards.each { view_card }
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

  def show_cards
    @cards.each do |card|
      if card.scores != 11
        puts "#{card.name} - #{card.scores} очков"
      else
        puts "#{card.name} - 1 или 11 очков"
      end
    end
  end

  def scores_not_enough
    count = 0
    @cards.each do |card|
      count += 1 if card.scores == 11
    end
    @scores = 12 if count == 2
    @scores
  end

  def game_scores
    puts 'Карты дилера:'
    @cards.each do |card|
      puts card.name.to_s
    end
    estimate_of_ace if @scores > 21
    puts "У дилера #{@scores} очков"
    @scores
  end
end
