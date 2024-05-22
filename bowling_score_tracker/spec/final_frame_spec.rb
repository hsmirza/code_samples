require_relative '../lib/final_frame'

RSpec.describe FinalFrame do
  context 'with a strike or spare' do
    it 'allows for a third roll' do
      frame = FinalFrame.new
      frame.rolls.push(10) # strike
      frame.rolls.push(10) # another strike
      expect(frame.complete?).to be false # Not complete until the third roll
      frame.rolls.push(10) # third strike
      expect(frame.complete?).to be true
    end
  end
end
