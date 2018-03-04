class Paripicipant
  include MakeABet

  attr_accessor :scores, :cards, :deck
  attr_reader   :bank, :name

  def initialize(name)
    @name = name
    @bank = 100
    @deck = CardDeck.new
  end

  def estimate_of_ace
    count = 0
    @deck.all_cards.each do |card|
      count += 1 if card.scores == 11
    end
    @scores -= 10 if count == 1 && @scores > 21
    estimate_of_ace_continue(count)
  end

  def estimate_of_ace_continue(count)
    @scores -= 20 if count == 2 && @scores != 32
    @scores -= 10 if count == 2 && @scores == 32
    @scores -= 20 if count == 3
  end

  def reload
    @deck = CardDeck.new
  end

  def game_scores
    name = @name
    puts "У #{name}:"
    puts @deck
    @scores = @deck.show_all_scores_in_deck
    estimate_of_ace if @scores > 21
    puts "#{@scores} очков"
    puts '*****************************************************'
    @scores
  end

  def show_cards
    puts "Карты #{name}"
    @deck.all_cards.each do |card|
      if card.scores != 11
        puts "#{card.name} - #{card.scores} очков"
      else
        puts "#{card.name} - 1 или 11 очков"
      end
    end
  end
end
