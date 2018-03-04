class Interface
  attr_reader :bank

  def initialize
    @bank = bank
  end

  def intro
    player = Player.new(meeting)
    diler = Diler.new
    puts 'Начнем!'
    sleep(0.5)
    distribution(player, diler)
  end

  def meeting
    puts '********************************************************************'
    print 'Введите свое имя: '
    name = ''
    name = gets.chomp.to_s while name.empty?
    name
  end

  def distribution(player, diler)
    @bank = Bank.new
    player.make_a_bet(@bank, player)
    diler.make_a_bet(@bank, diler)
    deck_game = CardDeck.new.fill_deck
    deck_game.get_two_cards(player)
    player.show_cards
    deck_game.get_two_cards(diler)
    puts "Карты #{diler.name}:"
    2.times { diler.view_card }
    choose(deck_game, player, diler)
  end

  def choose(deck_game, player, diler)
    print "********************************\n1. Взять карту.\n2. Пропустить ход
    \r3. Открыть карты.\nВыберите пункт: "
    article = gets.chomp.to_i
    continue_game(article, deck_game, player, diler)
  end

  def continue_game(article, deck_game, player, diler)
    if article == 2
      diler_move(deck_game, diler)
      end_of_game(player, diler)
    end
    end_of_game(player, diler) if article == 3
    article1(article, deck_game, player, diler)
  end

  def article1(article, deck_game, player, diler)
    return unless article == 1
    deck_game.take_a_card(player)
    puts "*************************************************\nВаши карты:\n"
    puts player.deck
    diler_move(deck_game, diler)
    end_of_game(player, diler)
  end

  def diler_move(deck_game, diler)
    puts "Дилер ходит...\n\n"
    sleep(0.5)
    deck_game.take_a_card(diler) if diler.scores_not_enough < 17
    puts "*************************************************\nКарты дилера:\n"
    diler.deck.all_cards.each { diler.view_card }
  end

  def end_of_game(player, diler)
    print "***********************************************************
          \rНажмите любую клавишу, чтобы посмотреть результат кона..."
    gets
    player_scores = player.game_scores
    diler_scores = diler.game_scores
    winer_and_looser(player_scores, diler_scores, player, diler)
    repeat(player, diler)
  end

  def winer_and_looser(player_scores, diler_scores, player, diler)
    if (player_scores > diler_scores && player_scores <= 21) ||
       (player_scores < diler_scores && diler_scores > 21 && player_scores <= 21)
      puts 'Вы выиграли!'
      2.times { player.receive_money(@bank) }
    end
    looser(player_scores, diler_scores, player, diler)
    equally(player_scores, diler_scores, player, diler)
  end

  def looser(player_scores, diler_scores, player, diler)
    return unless (player_scores < diler_scores && diler_scores <= 21) ||
                  player_scores > 21
    puts "#{player.name}, Вы проиграли!"
    2.times { diler.receive_money(@bank) }
  end

  def equally(player_scores, diler_scores, player, diler)
    return unless player_scores == diler_scores
    puts 'Ничья!'
    player.receive_money(@bank)
    diler.receive_money(@bank)
  end

  def repeat(player, diler)
    enough_money(player, diler)
    puts "#{player.name}, у Вас всего #{player.bank} USD."
    print "У дилера #{diler.bank} USD.\n\rХотите продолжить? (Y / N): "
    switch = gets.chomp.to_s
    if %w[y Y].include?(switch)
      player.reload
      diler.reload
      distribution(player, diler)
    else game_over
    end
  end

  def enough_money(player, diler)
    if diler.bank.zero?
      puts 'Вы выиграли все деньги дилера!'
      game_over
    elsif player.bank.zero?
      puts 'Вы проиграли все свои деньги!'
      game_over
    end
  end

  def game_over
    abort
  end
end
