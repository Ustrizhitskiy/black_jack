class Account
  attr_accessor :money
  BET = 10

  def initialize
    @money = 0
  end

  def start
    @money = 100
    self
  end

  def give_money(participant)
    @money -= BET
    participant.account.money += BET
  end

  def receive_bet(participant)
    participant.account.money -= BET
    @money += BET
    if participant.is_a?(Player)
      puts "Ваша ставка: #{BET} USD, у Вас оталось: #{participant.account.money} USD"
    else
      puts "Ставка дилера: #{BET} USD, у дилера оталось: #{participant.account.money} USD"
    end
    puts "В банке для ставок #{@money} USD"
    sleep(0.5)
  end
end
