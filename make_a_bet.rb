module MakeABet
  BET = 10

  def make_a_bet(bank, participant)
    @bank -= BET
    bank.take_a_bet(BET)
    if participant.is_a?(Player)
      puts "Ваша ставка: #{BET} USD, у Вас оталось: #{@bank} USD"
    else
      puts "Ставка дилера: #{BET} USD, у дилера оталось: #{@bank} USD"
    end
    puts "В банке для ставок #{bank.money} USD"
    sleep(0.5)
  end

  def receive_money(bank)
    @bank += BET
    bank.give_money(BET)
  end
end
