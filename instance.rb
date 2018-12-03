require_relative "./game.rb"
require_relative "./player.rb"

p1 = Player.new
p2 = Player.new
game = Game.new(3, p1, p2, 20)
ans = nil
def which_player(cur, p1, p2)
  return (cur % 2 == 0) ? "Player 1" : "Player 2"
end

current = 1

while true
  turn, n1, n2 = nil
  if !game.is_next?
    puts "----- GAME OVER -----"
    puts game.who_won?
    break
  end
  turn, n1, n2 = game.turn
  print "#{which_player(current , p1, p2)}: #{turn}"
  ans = gets.chomp
  puts "#{(ans == (n1+n2))? game.correct { which_player } : game.deny { which_player } }"

  puts game.game_score
  current += 1
  puts "----- NEW TURN -----"
end