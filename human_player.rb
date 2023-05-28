# frozen_string_literal: true

class HumanPlayer
  attr_reader :mode

  def initialize(mode)
    @mode = mode
  end

  def choose_4_colors(color_pallette, round)
    puts "\nRound #{round}: Choose 4 colors (1-6) or q to quit:"
    input = gets.chomp

    if input == 'q'
      quit_game()
    else
      numbers = input.split('').map(&:to_i)
      if numbers.length == 4 && numbers.all? { |element| element.between?(1, 6) }
        color_pallette.values_at(numbers[0]-1, numbers[1]-1, numbers[2]-1, numbers[3]-1)
      else
        puts 'You have to choose 4 numbers BETWEEN 1 and 6!:'.colorize(:red)
        choose_4_colors(color_pallette, round)
      end
    end
  end

  def quit_game()
    puts 'Was fun playing with you. See you next time!'
    false
  end
end
