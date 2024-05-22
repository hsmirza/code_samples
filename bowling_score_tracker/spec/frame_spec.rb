require_relative '../lib/frame'

RSpec.describe Frame do
  context 'when initializing a new frame' do
    it 'starts with empty rolls' do
      frame = Frame.new
      expect(frame.rolls).to be_empty
    end
  end

  context 'when rolling a strike' do
    it 'is marked complete' do
      frame = Frame.new
      frame.rolls.push(10)
      expect(frame.strike?).to be true
      expect(frame.complete?).to be true
    end
  end

  context 'when rolling a spare' do
    it 'is marked complete' do
      frame = Frame.new
      frame.rolls.push(7, 3)
      expect(frame.spare?).to be true
      expect(frame.complete?).to be true
    end
  end
end
