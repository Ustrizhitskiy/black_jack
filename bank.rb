class Bank
  attr_reader :money

  def initialize
    @money = 0
  end

  def take_a_bet(bet)
    @money += bet
  end

  def give_money(bet)
    @money -= bet
  end
end
