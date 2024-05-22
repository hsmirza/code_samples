require_relative '../lib/bowling_game'

RSpec.describe BowlingGame do
  subject(:game) { BowlingGame.new }

  context 'when a new game starts' do
    it 'initializes with an empty frame' do
      expect(game.frames.size).to eq(1)
      expect(game.frames.first.rolls).to be_empty
    end
  end

  context 'scoring' do
    it 'correctly calculates a simple score' do
      2.times { game.roll(4) } # Frame 1: 8 points
      2.times { game.roll(3) } # Frame 2: 6 points
      expect(game.score).to eq(14)
    end

    it 'correctly scores a strike followed by non-strike rolls' do
      game.roll(10) # Strike
      game.roll(3)
      game.roll(4)
      expect(game.score).to eq(24) # Frame 1: 10 + 3 + 4, Frame 2: 3 + 4
    end

    it 'correctly scores a spare followed by a non-spare roll' do
      game.roll(7)
      game.roll(3) # Spare
      game.roll(5)
      expect(game.score).to eq(20) # Frame 1: 7 + 3 + 5, Frame 2: 5
    end

    it 'correctly scores the final frame with strikes' do
      9.times { game.roll(10) } # 9 strikes in a row
      game.roll(10) # Final frame strikes
      game.roll(10)
      game.roll(10)
      expect(game.score).to eq(300) # Perfect game
    end
  end
end


