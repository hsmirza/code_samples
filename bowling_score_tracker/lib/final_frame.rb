require_relative 'frame'

class FinalFrame < Frame
  def final_frame?
    true
  end

  def complete?
    @rolls.length == 3 || (@rolls.length == 2 && !spare? && !strike?)
  end
end
