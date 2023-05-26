require_relative "./human_player"
require_relative "./comp_player"
require_relative "./ball"
require "colorize"
require 'pry-byebug'

class MastermindGame
  attr_accessor :guess_rows, :game_round
  attr_reader :human_player, :comp_player, :mode, :color_pallette

  def initialize(mode)
    @mode = mode
    @human_player = HumanPlayer.new(mode)
    @comp_player = CompPlayer.new(mode)
    @guess_rows = []
    @color_pallette = [Ball.new(:red), Ball.new(:blue), Ball.new(:green), Ball.new(:yellow), Ball.new(:magenta), Ball.new(:black)]
    @game_round = 1;
  end

  def self.round
    return self.round
  end

  def start_game()
    if mode == 1
      play_human_creates()
    else 
      play_human_breaks()
    end
  end

  private
  def play_human_breaks()
    # make and safe secret code
    self.comp_player.make_secret_code(self.color_pallette)
    
    puts "The 6 colors you can choose from (1-6):"
    print_colors(self.color_pallette)
    for i in 0..11
      chosen_colors = human_player.choose_4_colors(self.color_pallette, self.game_round)
      unless chosen_colors
        quit_game()
      end
      guess_rows.push(chosen_colors)
      print_colors(guess_rows[i])
      comp_player.give_feedback(guess_rows[i])
    end
  end

  def print_colors(balls_to_print)
    balls_to_print.length.times do |i|
      print " #{color_pallette[i].symbol} "
    end
    puts ""
  end


  def quit_game()
    return
  end


end