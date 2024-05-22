require_relative 'bowling_game'

class BowlingInterface
  def initialize
    @games = [BowlingGame.new]
    @current_game_index = 0
  end

  def start_game
    puts "Welcome to the Bowling Score Tracker!"
    players = ask_for_players

    [0...players].each do
      @games << BowlingGame.new
    end


    while !game_complete?
      display_scores
      puts "Player #{@current_game_index + 1}:"
      pins = ask_for_pins
      current_game.roll(pins) unless pins.nil?

      if current_game.frames.last.complete?
        @current_game_index += 1
      end

      clear_screen
    end
    display_final_scores
  end

  private

  def current_game
    @games[@current_game_index]
  end

  def ask_for_pins
    puts 'Enter the number of pins knocked down (X for strike, / for spare, - for miss):'
    input = gets.chomp.upcase
    while !valid_frame_input?(input)
      puts "Invalid input based on the current frame. Please try again."
      input = gets.chomp.upcase
    end
    interpret_input(input)
  end

  def ask_for_players
    puts 'Enter the number of players'
    input = gets.chomp.to_i
    # TODO: valide input
  end

  def valid_frame_input?(input)
    current_frame = current_game.frames.last

    unless input.match(/^\d$/) || input == '/' || input == '-' || input == 'X'
      return false
    end

    if current_frame.final_frame?
      validate_final_frame(input, current_frame)
    elsif current_frame.rolls.length == 1
      validate_second_roll(input, current_frame)
    else
      true
    end
  end

  def validate_second_roll(input, current_frame)
    return true if current_frame.rolls.first == 10
    remaining_pins = 10 - current_frame.rolls.first
    input.match(/^\d$/) ? input.to_i.between?(0, remaining_pins) : true
  end

  def validate_final_frame(input, current_frame)
    if current_frame.rolls.length == 2
      remaining_pins = 10 - current_frame.rolls.last
      input.match(/^\d$/) ? input.to_i.between?(0, remaining_pins) : true
    else
      validate_second_roll(input, current_frame)
    end
  end

  def interpret_input(input)
    case input
    when 'X' then 10
    when '/' then 10 - @game.frames.last.rolls.last.to_i
    when '-' then 0
    else input.to_i
    end
  end

  def display_scores
    clear_screen

    @games.each_with_index do |game, counter|
      puts "Game #{counter + 1}"
      game.frames.each_with_index do |frame, index|
        frame_score = game.calculate_frame_score(index)
        puts "Frame #{index + 1}: Rolls: #{frame.rolls.join(', ')} | Score: #{frame_score}"
      end
      puts "Total Score: #{game.score} \n"
    end
  end

  def display_final_scores
    puts "Final Scores"

    @games.each_with_index do |game, counter|
      puts "Final Scores For Game: #{counter + 1}"

      game.frames.each_with_index do |frame, index|
        puts "Frame #{index + 1}: #{frame.rolls.join(', ')} - Score: #{game.calculate_frame_score(index)}"
      end
      puts "Game complete! Final Score: #{game.score}"
    end
  end

  def game_complete?
    @games.last.frames.size == 10 && @game.last.frames.last.complete?
  end

  # def current_frame_index
  #   @game.frames.size
  # end

  def clear_screen
    system "clear"
  end
end
