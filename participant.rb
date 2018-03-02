class Paripicipant
  include MakeABet

  attr_accessor :scores, :cards
  attr_reader   :bank, :name

  def initialize(name)
    @name = name
    @bank = 100
    @cards = []
    @scores = 0
  end

  def get_two_cards(card_deck)
    2.times do
      card = card_deck.all_cards.shuffle[0]
      card_deck.all_cards.delete(card)
      take_a_card(card, card_deck)
    end
    card_deck
  end

  def take_a_card(card, card_deck)
    return unless @cards.size <= 2
    card_deck.all_scores_in_deck -= card.scores.to_i
    @cards << card
    @scores += card.scores.to_i
  end

  def estimate_of_ace
    count = 0
    @cards.each do |card|
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
    @cards = []
    @scores = 0
  end

  def game_scores
    name = @name
    puts "У #{name} карты:"
    @cards.each do |card|
      puts card.name.to_s
    end
    estimate_of_ace if @scores > 21
    puts "У #{name} #{@scores} очков"
    puts '*****************************************************'
    @scores
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
end
