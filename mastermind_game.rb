require_relative "./human_player"
require_relative "./comp_player"
require_relative "./ball"
require "colorize"
require 'pry-byebug'

class MastermindGame
  attr_accessor :guess_rows, :game_round, :secret_code
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
    self.secret_code= self.comp_player.make_secret_code(self.color_pallette)
    print_colors(self.secret_code)
    print_color_palette()
    for i in 0..11
      chosen_colors = human_player.choose_4_colors(self.color_pallette, self.game_round)
      unless chosen_colors
        break
      end
      self.guess_rows.push(chosen_colors)
      print_colors(self.guess_rows[i])
      self.comp_player.give_feedback(self.guess_rows[i])
    end
    declare_creater_wins()
  end

  def play_human_creates()
    puts "Create a secret code:"
    print_colors(self.color_pallette)
    self.secret_code= self.human_player.choose_4_colors(self.color_pallette, 0)
    self.guess_rows.push(self.comp_player.make_guess(self.color_pallette, 1))
    for i in 1..12 do
      print_comp_guess(self.guess_rows[i-1], i-1)
      feedback = give_feedback(self.guess_rows[i-1])
      unless feedback
        break
      end
      self.guess_rows.push(self.comp_player.make_guess(self.color_pallette, i+1))
    end
  end

  def give_feedback(chosen_colors)
    help_arr = check_right_color_and_pos(chosen_colors)
    number_ball_right_color_and_pos = help_arr.first
    if number_ball_right_color_and_pos == 4
      declare_breaker_wins()
    else
      right_indexes = help_arr.last
      number_ball_right_color = check_right_color(chosen_colors, right_indexes)
      print_full_circles(number_ball_right_color_and_pos)
      print_empty_circles(number_ball_right_color)
    end
  end

  def check_right_color_and_pos(chosen_colors)
    sum = 0
    right_ball_saver = []
    chosen_colors.each_with_index do |ball, index|
      if ball.color_name == self.secret_code[index].color_name
        sum = sum + 1
        right_ball_saver.push(ball)
      end
    end
    return [sum, right_ball_saver]
  end 

  def check_right_color(chosen_colors, right_ball_saver)2
    chosen_colors.select{|ball| !right_ball_saver.include?(ball) && self.secret_code.include?(ball)}.length
  end

  def print_colors(balls_to_print)
    balls_to_print.length.times do |i|
      print " #{balls_to_print[i].symbol} "
    end
  end

  def print_color_palette()
    puts "The 6 colors you can choose from (1-6):"
    print_colors(self.color_pallette)
    puts ""
  end

  def print_comp_guess(balls_to_print, round)
    print "Round #{round}: "
    print_colors(balls_to_print)
    puts ""
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
    return false
  end


end