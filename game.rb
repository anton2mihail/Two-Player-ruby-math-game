class Game
  attr_accessor :p1, :p2
  def initialize(max_score, p1, p2, difficulty)
    @difficulty = difficulty
    @max_score = max_score
    @p1 = p1
    @p2 = p2
  end

  def self.generate_problem
    return [1+rand(difficulty), 1+ rand(difficulty)] 
  end

  def turn
    r_num1,r_num2 = self.generate_problem
    return ["What does #{r_num1} + #{r_num2} equal?", r_num1 , r_num2]
  end

  def game_score
    return "P1: #{p1.score}/#{max_score} vs P2: #{p2.score}/#{max_score}"
  end

  def correct
    return "#{yield}: Yes! You are Correct."
  end

  def deny
    return "#{yield}: Seriously? No!"
  end

  def is_next?
    return (p1.score == 3 || p2.score == 3 || p2.lives == 0 || p1.lives == 0)
  end

  def who_won?
    if(p1.score == 3 || p2.lives == 0)
      return "Player 1 Wins with a score of #{p1.score}/#{max_score}"
    end
    elsif (p2.score == 3 || p1.lives == 0)
      return "Player 2 Wins with a score of #{p2.score}/#{max_score}"
    end
    return nil
  end
end