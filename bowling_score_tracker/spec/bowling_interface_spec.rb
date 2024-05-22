require_relative '../lib/bowling_interface'

RSpec.describe BowlingInterface do
  subject(:interface) { BowlingInterface.new }

  describe "#start_game" do
    before do
      allow(interface).to receive(:puts)  # Stubbing the puts method to suppress output during tests
      allow(interface).to receive(:clear_screen)  # Assuming clear_screen just clears the terminal
    end

    it "welcomes players" do
      allow(interface).to receive(:game_complete?).and_return(true)  # Immediately exit the game loop
      expect(interface).to receive(:puts).with("Welcome to the Bowling Score Tracker!")
      interface.start_game
    end

    context "when receiving rolls" do
      it "processes a strike" do
        allow(interface).to receive(:gets).and_return("X")  # Simulate a strike then exit
        allow(interface).to receive(:game_complete?).and_return(false, true)  # End after one loop
        expect(interface).to receive(:interpret_input).with("X").and_call_original
        interface.start_game
      end

      it "handles a spare correctly" do
        allow(interface).to receive(:gets).and_return("7", "/")  # Simulate a 7 then a spare, then exit
        allow(interface).to receive(:game_complete?).and_return(false, false, true)  # Allow for two inputs before exiting
        expect(interface).to receive(:interpret_input).twice.and_call_original
        interface.start_game
      end

      it "validates incorrect input and asks again" do
        allow(interface).to receive(:gets).and_return("invalid", "X")  # First input invalid, then correct it
        allow(interface).to receive(:game_complete?).and_return(false, true)  # End after correction
        expect(interface).to receive(:puts).with("Invalid input based on the current frame. Please try again.").once
        interface.start_game
      end
    end
  end
end
