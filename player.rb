class Player
  attr_accessor :score
  attr_accessor :lives
  def initialize
    @score = 0
    @lives = 3
  end
  def right
    @score += 1
  end
  def wrong
    @lives -= 1
  end

  def dead?
    return @lives == 0 ? true : false
  end

  def to_s
    return "Player #{yield}:"
  end
end