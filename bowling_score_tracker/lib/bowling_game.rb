require_relative 'final_frame'

class BowlingGame
  attr_accessor :frames

  def initialize
    @frames = [Frame.new]
  end

  def roll(pins)
    adjust_frames(pins)
  end

  def score
    @frames.each_with_index.sum do |frame, index|
      frame_score = frame.rolls.sum
      frame_score += strike_bonus(index) if frame.strike? && index < 9
      frame_score += spare_bonus(index) if frame.spare? && index < 9
      frame_score
    end
  end

  def calculate_frame_score(frame_index)
    @frames[0..frame_index].each_with_index.sum do |frame, index|
      if frame.strike?
        10 + strike_bonus(index)
      elsif frame.spare?
        10 + spare_bonus(index)
      else
        frame.rolls.sum
      end
    end
  end

  private

  def adjust_frames(pins)
    if @frames.last.complete? && @frames.size < 10
      frame = @frames.size == 9 ? FinalFrame.new : Frame.new
      @frames << frame
    end
    @frames.last.rolls << pins
  end

  def strike_bonus(index)
    bonus = 0
    if index + 1 < @frames.size
      bonus = @frames[index + 1].rolls.first(2).sum
      bonus += @frames[index + 2].rolls.first if @frames[index + 1].strike? && index + 2 < @frames.size
    end
    bonus
  end

  def spare_bonus(index)
    @frames[index + 1]&.rolls&.first || 0
  end
end
