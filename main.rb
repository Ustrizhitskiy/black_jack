require_relative 'account'
require_relative 'card_deck'
require_relative 'card'
require_relative 'participant'
require_relative 'player'
require_relative 'diler'
require_relative 'interface'

puts '********************************************************************'
print 'Введите свое имя: '
name = ''
name = gets.chomp.to_s while name.empty?
player = Player.new(name)
diler = Diler.new
answer = 'y'
while %w[y Y].include?(answer)
  player.reload
  diler.reload
  Interface.new(player, diler, CardDeck.new.fill_deck).intro(player, diler)
  if diler.account.money.zero?
    puts 'Вы выиграли все деньги дилера!'
    abort
  elsif player.account.money.zero?
    puts 'Вы проиграли все свои деньги!'
    abort
  end
  print 'Хотите продолжить? (Y / N): '
  answer = gets.chomp.to_s
end
