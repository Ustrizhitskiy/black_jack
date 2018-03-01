class Interface
  attr_reader :count

  def initialize
    @count = 48
  end

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
    name = gets.chomp.to_s while name.empty?
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
    if article == 1
      take_a_card(card_deck_reduced, player)
      puts "*************************************************\nВаши карты:\n\n"
      player.cards.each { |card| puts player.view_card(card).to_s }
      diler_move(card_deck_reduced, diler)
    end
    diler_move(card_deck_reduced, diler) if article == 2
    end_of_game(player, diler)
  end

  def take_a_card(card_deck_reduced, participant)
    card = card_deck_reduced.all_cards[rand(@count)]
    @count -= 1
    card_deck_reduced.all_cards.delete(card)
    participant.take_a_card(card)
    participant.show_cards if participant.is_a? Player
  end

  def diler_move(card_deck_reduced, diler)
    puts "Дилер ходит...\n\n"
    sleep(0.5)
    take_a_card(card_deck_reduced, diler)
    #diler.show_cards
    puts "*************************************************\nКарты дилера:\n"
    diler.cards.each { diler.view_card }
  end

  def end_of_game(player, diler)
    print "*******************************************************
          \rНажмите любую клавишу, чтобы посмотреть результат кона...
          \r*******************************************************"
    gets
    player.game_scores
    diler.game_scores
  end

  def game_over
    abort
  end
end
