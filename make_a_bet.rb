module MakeABet
  BET = 10.freeze

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

  def get_two_cards(card_deck, j)
    2.times do
      card = card_deck.all_cards[rand(j)]
      card_deck.all_cards.delete(card)
      take_a_card(card)
      j -= 1
    end
    card_deck
  end
end
