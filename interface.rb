class Interface
  def intro
    player = Player.new(meeting)
    puts 'Начнем!'
    sleep(0.5)
    distribution(player)
  end

  def meeting
    puts '********************************************************************'
    print 'Введите свое имя: '
    name = ''
    while name.empty?
      name = gets.chomp.to_s
    end
  end

  def distribution(player)
    bank = Bank.new
    diler = Diler.new
    player.make_a_bet(bank, player)
    diler.make_a_bet(bank, diler)
    card_deck_reduced = player.first_distribution(CardDeck.new)
    card_deck_reduced = diler.first_distribution(card_deck_reduced)
    #i = 0
    #card_deck_reduced.all_cards.each do |card|
    #  puts i
    #  i += 1
    #end
    print "*************\n1. Взять карту.\n2. Пропустить ход
    \r3. Открыть карты.\nВыберите пункт: "
    article = gets.chomp.to_i
    take_a_card(card_deck_reduced, player) if article == 1
    diler_move(card_deck_reduced) if article == 2
    end_of_game if article == 3
  end

  def take_a_card(card_deck_reduced, player)
    card = card_deck_reduced.all_cards[rand(48)]
    card_deck_reduced.all_cards.delete(card)
    player.take_a_card(card)
    player.cards.each { |card| puts "#{card.name}   |   #{card.scores}" }
    diler_move
  end

  def diler_move
    puts "Diler move"
  end

  def end_of_game
    puts "Открываем карты"
  end

  def game_over
    abort
  end

end
