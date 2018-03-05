class Interface
  attr_reader :account

  def initialize(player, diler, deck_game)
    @game_account = account
    @player = player
    @diler = diler
    @deck_game = deck_game
  end

  def intro(player, diler)
    puts 'Начнем!'
    sleep(0.5)
    distribution(player, diler)
  end

  def distribution(player, diler)
    @game_account = Account.new
    @game_account.receive_bet(player)
    @game_account.receive_bet(diler)
    deck_game = @deck_game
    deck_game.give_two_cards(player)
    deck_game.show_cards(player)
    deck_game.give_two_cards(diler)
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
    diler.deck.each_card { diler.view_card }
  end

  def end_of_game(player, diler)
    print "***********************************************************
          \rНажмите любую клавишу, чтобы посмотреть результат кона..."
    gets
    player_scores = player.deck.game_scores(player)
    diler_scores = diler.deck.game_scores(diler)
    winer_and_looser(player_scores, diler_scores, player, diler)
    puts "#{player.name}, у Вас всего #{player.account.money} USD."
    print "У дилера #{diler.account.money} USD."
  end

  def winer_and_looser(player_scores, diler_scores, player, diler)
    if (player_scores > diler_scores && player_scores <= 21) ||
       (player_scores < diler_scores && diler_scores > 21 && player_scores <= 21)
      puts 'Вы выиграли!'
      2.times { @game_account.give_money(player) }
    end
    looser(player_scores, diler_scores, player, diler)
    equally(player_scores, diler_scores, player, diler)
  end

  def looser(player_scores, diler_scores, player, diler)
    return unless (player_scores < diler_scores && diler_scores <= 21) ||
                  player_scores > 21
    puts "#{player.name}, Вы проиграли!"
    2.times { @game_account.give_money(diler) }
  end

  def equally(player_scores, diler_scores, player, diler)
    return unless player_scores == diler_scores
    puts 'Ничья!'
    @game_account.give_money(player)
    @game_account.give_money(diler)
  end

  def game_over
    abort
  end
end
