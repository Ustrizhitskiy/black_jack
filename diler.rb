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
    puts "*************************************************\nКарты дилера:\n\n"
    @cards.each { |card| puts "#{view_card}" }
    card_deck_reduced
  end

  def view_card
    puts "* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *
        \r* * * * *"
  end

  # принять карту
  def take_a_card(card)
    if @cards.size <= 2
      @cards << card
      @scores += card.scores.to_i
    end
  end

  # пропустить ход (если очков 17 и более)
  def skip_move
  end
end
