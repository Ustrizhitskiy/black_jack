class Interface
  def initialize
  end

  def intro
    puts '********************************************************************'
    print 'Введите свое имя: '
    player = Player.new(gets.chomp.to_s)
    puts 'Начнем!'
    sleep(0.5)
    diler = Diler.new
    bank = Bank.new
    card_deck = CardDeck.new
    distribution(card_deck, player, diler, bank)
  end

  def distribution(card_deck, player, diler, bank)
    player.make_a_bet(bank, player)
    diler.make_a_bet(bank, diler)
    player.first_distribution(card_deck)

    card = card_deck.all_cards[rand(51)]
    card_deck.all_cards.delete(card)
    player.take_a_card(card)
    puts "Ваши карты:\n\n"
    player.cards.each { |card| puts "#{view_card(card)}"}
    player.show_cards
  end

  def view_card(card)
    puts "* * * * *
        \r*       *
        \r*       *
        \r*  #{card.name}   *
        \r*       *
        \r*       *
        \r* * * * *"
  end
end
