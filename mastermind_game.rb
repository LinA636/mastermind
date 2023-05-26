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
    @color_pallette = [Ball.new(:red), Ball.new(:blue), Ball.new(:green), Ball.new(:yellow), Ball.new(:magenta), Ball.new(:light_black)]
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
    print_colors(self.comp_player.secret_code)
    puts "The 6 colors you can choose from (1-6):"
    print_colors(self.color_pallette)
    puts ""
    for i in 0..11
      chosen_colors = human_player.choose_4_colors(self.color_pallette, self.game_round)
      unless chosen_colors
        quit_game()
      end
      guess_rows.push(chosen_colors)
      print_colors(guess_rows[i])
      circle_nums = comp_player.give_feedback(guess_rows[i])
      if circle_nums.first == 4
        declare_breaker_wins()
      else
        print_full_circles(circle_nums.first)
        print_empty_circles(circle_nums.last)
      end
    end
    declare_creater_wins()
  end

  def print_colors(balls_to_print)
    balls_to_print.length.times do |i|
      print " #{balls_to_print[i].symbol} "
    end
  end

  def print_empty_circles(number)
    number.times do
      print " \u{20DD} "
    end
  end

  def print_full_circles(number)
    print "   "
    number.times do
      print "\u{23FA} "
    end
  end

  def declare_breaker_wins()
    if self.mode == 2
      puts "\nCongrats, you guessed the right code. You win!"
      quit_game()
    else
      puts "\nYou loose. The computer guessed your secret code. Try again."
      quit_game()
    end
  end

  def declare_creater_wins()
    if self.mode == 1
      puts "\nCongrats, you beat the computer. Your Code was too strong!"
      quit_game()
    else
      puts "\nSorry, the 12 guesses are up. Next time you got it!"
      quit_game()
    end
  end

  def quit_game()
    return
  end


end