class Diler
  include MakeABet
  
  attr_reader :bank, :cards, :scores

  def initialize
    @bank = 100
    @cards = []
    @scores = 0
  end

  # принять карту
  def take_a_card(card)
    if @cards.size <= 2
      @cards << card
      @scores += card.points
    end
  end

  # пропустить ход (если очков 17 и более)
  def skip_move
  end
end
