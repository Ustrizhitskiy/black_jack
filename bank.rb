class Bank
  attr_reader :money

  def initialize
    @money = 0
  end

  # принять ставку
  def take_a_bet(bet)
    @money += bet
  end

  # выдать деньги
  def give_money
    @money -= 10 if @money >= 10
  end
end
