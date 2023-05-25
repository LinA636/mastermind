class HumanPlayer 
  attr_reader :mode

  def initialize(mode)
    @mode = mode 
  end

  def choose_4_colors(round)
    puts "Round #{round}: Choose 4 colors (1-6) or q to quit:"
    input = gets.chomp

    if input == "q"
      return quit_game()
    else
      numbers = input.split("").map {|element| element.to_i}
      if numbers.all?{|element| element.between?(1,6)}
        return input
      else
        puts "You have to choose a number BETWEEN 1 and 6!:".colorize(:red)
        choose_4_colors(round)
      end
    end

  end

  def quit_game()
    puts "Was fun playing with you. See you next time!"
    return false
  end
end