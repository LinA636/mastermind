# frozen_string_literal: true

class HumanPlayer
  attr_reader :mode

  def initialize(mode)
    @mode = mode
  end

  def choose_4_colors(round)
    puts "\nRound #{round}: Choose 4 colors (1-6) or q to quit:"
    input = gets.chomp

    if input == 'q'
      quit_game()
    else
      numbers = input.split('').map(&:to_i)
      if numbers.length == 4 && numbers.all? {|element| element.between?(1, 6)}
        return numbers
      else
        puts 'You have to choose 4 numbers BETWEEN 1 and 6!:'.colorize(:red)
        choose_4_colors(round)
      end
    end
  end

  def make_secret_code()
    puts "Choose 4 different colors (1-6) or q to quit:"
    input = gets.chomp

    if input == 'q'
      quit_game()
    else
      numbers = input.split('').map(&:to_i)
      if numbers.uniq.length == 4 && numbers.all? {|element| element.between?(1, 6)}
        return numbers
      else
        puts 'You have to choose 4 UNEQUAL numbers BETWEEN 1 and 6!:'.colorize(:red)
        make_secret_code()
      end
    end
  end

  def quit_game()
    puts 'Was fun playing with you. See you next time!'
    exit
  end
end
