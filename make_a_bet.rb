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

  def get_two_cards(card_deck, j)
    2.times do
      card = card_deck.all_cards[rand(j)]
      card_deck.all_cards.delete(card)
      take_a_card(card)
      j -= 1
    end
    card_deck
  end

  def take_a_card(card)
    return unless @cards.size <= 2
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
    @scores -= 20 if count == 2 && @scores == 32
    @scores -= 10 if count == 2 && @scores != 32
    @scores -= 20 if count == 3
  end

  def reload
    @cards = []
    @scores = 0
  end
end
