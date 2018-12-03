require_relative "./game.rb"
require_relative "./player.rb"

p1 = Player.new
p2 = Player.new
game = Game.new(3, p1, p2, 20)
ans = nil
def which_player(cur, p1, p2)
  return (cur % 2 == 0) ? p1 : p2
end

current = 1
while true
  if game.is_next?
    puts game.game_score
    break
  end
  turn, n1, n2 = game.turn
  print "#{which_player(current , p1, p2)}: #{turn}"
  ans = gets.chomp








  current += 1
  puts "----- NEW TURN -----"
end