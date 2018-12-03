class Game
  attr_accessor :p1, :p2, :difficulty
  def initialize(max_score, p1, p2, difficulty)
    @difficulty = difficulty
    @max_score = max_score
    @p1 = p1
    @p2 = p2
  end
  
  def score_formatter
    pl, max = yield
    return  "#{pl.score}/#{max}"
  end

  def generate_problem
    rnd1 = Random.new
    rnd2 = Random.new
    return [1+rnd1.rand(1..@difficulty.to_i).round(), 1+rnd2.rand(1..@difficulty.to_i).round()] 
  end

  def turn
    r_num1,r_num2 = generate_problem()
    return ["What does #{r_num1} + #{r_num2} equal?", r_num1 , r_num2]
  end

  def game_score
    return "P1: #{score_formatter { [p1, @max_score] } } vs P2: #{score_formatter { [p2, @max_score] } }"
  end

  def correct
    prompt, pl = yield
    pl.right
    return "#{prompt}: Yes! You are Correct."
  end

  def deny
    prompt, pl = yield
    pl.wrong
    return "#{prompt}: Seriously? No!"
  end

  def is_next?
    return (p1.score == 3 || p2.score == 3 || p2.dead? || p1.dead?)
  end

  def who_won?
    if(p1.score == 3 || p2.lives == 0)
      return "Player 1 Wins with a score of #{score_formatter { [p1, @max_score] } }"
    elsif(p2.score == 3 || p1.lives == 0)
      return "Player 2 Wins with a score of  #{score_formatter { [p2, @max_score] } }"
    end
    return nil
  end
end