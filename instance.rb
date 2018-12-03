require_relative "./game.rb"
require_relative "./player.rb"

p1 = Player.new
p2 = Player.new
game = Game.new(3, p1, p2, 20)
puts game.difficulty
ans = nil
def which_player(cur, p1, p2)
  return (cur % 2 == 0) ? "Player 1" : "Player 2"
end
def which_player_obj(cur, p1, p2)
  return (cur % 2 == 0) ? p1 : p2
end

current = 0
puts "#{game.is_next?}"

while true
  turn, n1, n2 = nil
  if game.is_next?
    puts "----- GAME OVER -----"
    puts game.who_won?
    break
  end
  turn, n1, n2 = game.turn
  print "#{which_player(current , p1, p2)}: #{turn}"
  ans = gets.chomp.to_i
  puts "#{(ans == (n1+n2))? game.correct { [which_player(current, p1, p2), which_player_obj(current, p1, p2)] } : game.deny { [which_player(current, p1, p2), which_player_obj(current, p1, p2)] } }"

  puts game.game_score
  current += 1
  puts "----- NEW TURN -----"
end