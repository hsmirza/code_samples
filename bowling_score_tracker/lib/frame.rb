class Frame
  attr_accessor :rolls

  def initialize
    @rolls = []
  end

  def strike?
    @rolls.first == 10
  end

  def spare?
    @rolls.sum == 10 && @rolls.length == 2
  end

  def complete?
    strike? || @rolls.length == 2 || (final_frame? && @rolls.length == 3)
  end

  def final_frame?
    false
  end
end
