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
    @color_pallette = [Ball.new(:red, 1), Ball.new(:blue, 2), Ball.new(:green, 3), Ball.new(:yellow,4), Ball.new(:magenta,5), Ball.new(:light_black,6)]
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
    self.secret_code= self.comp_player.make_secret_code()
    print_color_palette()
    for i in 0..11
      id_chosen_colors = human_player.choose_4_colors(self.game_round)
      self.guess_rows.push(id_chosen_colors)
      print_colors(self.guess_rows[i])
      give_feedback(self.guess_rows[i])
      self.game_round += 1
    end
    declare_creater_wins()
  end

  def play_human_creates()
    puts "Create a secret code:"
    print_color_palette()
    self.secret_code= self.human_player.make_secret_code()
    for i in 1..12 do
      self.guess_rows.push(self.comp_player.make_guess())
      print_comp_guess(self.guess_rows[i-1], self.game_round)
      give_feedback(self.guess_rows[i-1])
      self.game_round += 1
    end
    declare_creater_wins()
  end

  def give_feedback(id_chosen_colors)
    full_matches = check_right_color_and_pos(id_chosen_colors)
    if full_matches.length == 4
      declare_breaker_wins()
    else
      half_matches = check_right_color(id_chosen_colors, full_matches)
      print_full_circles(full_matches.length)
      print_empty_circles(half_matches.length)
    end 
  end

  def check_right_color_and_pos(id_chosen_colors)
    id_matches = []
    id_chosen_colors.each_with_index do |id, index|
      if id == self.secret_code[index]
        id_matches.push(id)
      end
    end
    return id_matches
  end 

  def check_right_color(id_chosen_colors, full_matches)
    half_matches = id_chosen_colors.select{|id| !full_matches.include?(id) && self.secret_code.include?(id)}
    half_matches.uniq
  end

  def print_colors(id_balls_to_print)
    id_balls_to_print.each{|id| print " #{self.color_pallette[id-1].symbol} "}
  end

  def print_color_palette()
    puts "The 6 colors you can choose from (1-6):"
    print_colors([1,2,3,4,5,6])
    puts ""
  end

  def print_comp_guess(id_balls_to_print, round)
    puts ""
    print "Round #{round}: "
    print_colors(id_balls_to_print)
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
    exit
  end


end