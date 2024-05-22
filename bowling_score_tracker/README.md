
# Bowling Score Tracker

A command-line application to track scores for a single-player game of ten-pin bowling, implemented in Ruby. This application allows players to input their scores roll-by-roll and calculates the total score according to standard bowling scoring rules.

## Features

- **Single Player Support**: Designed for tracking scores in a single-player game.
- **Accurate Scoring**: Handles strikes, spares, and open frames with cumulative score updates.
- **Interactive CLI**: Simple and interactive command-line interface for inputting roll outcomes.

## Prerequisites

- Ruby (2.7 or later recommended) installed on your machine. Visit [Ruby's official site](https://www.ruby-lang.org/en/documentation/installation/) for installation instructions.

## Getting Started

1. **Clone the Bundle**

   Navigate to the directory where you have saved the bundle file and run following commmands:

   ```bash
   git clone bowling_score_tracker.bundle -b main
   cd bowling_score_tracker
   ```

2. **Running the Game**

   Navigate to the project directory and execute:

   ```bash
   ruby bin/start_game
   ```

   Follow the on-screen prompts to enter your scores.

## Usage Instructions

- Input `X` for a strike.
- Input `/` for a spare.
- Input `-` for a miss.
- Input the number of pins knocked down for other outcomes.

After each roll, the game will automatically calculate and display your cumulative score.

## Testing

This project includes RSpec tests. Run the tests to ensure the application functions as expected:

1. Install RSpec (if not already installed):

   ```bash
   gem install rspec
   ```

2. Run the tests:

   ```bash
   rspec
   ```

## Contributing

Contributions are welcome! If you have ideas for improvements or bug fixes, please feel free to:

- Fork the repository.
- Create a feature branch (`git checkout -b feature/AmazingFeature`).
- Commit your changes (`git commit -m 'Add some AmazingFeature'`).
- Push to the branch (`git push origin feature/AmazingFeature`).
- Open a pull request.
