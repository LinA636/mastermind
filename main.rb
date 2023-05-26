# frozen_string_literal: true

require_relative './mastermind_game'
#
# puts "Do you want to be the CREATOR (1) or the BREAKER (2)? "
# mode = gets.chomp.to_i
#
# until mode == 1 || mode == 2
#   puts "Do you want to be the CREATOR (1) or the BREAKER (2)? "
#   mode = gets.chomp.to_i
# end
mode = 2
game = MastermindGame.new(mode)
game.start_game
