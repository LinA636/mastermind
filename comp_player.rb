require_relative "./ball"

class CompPlayer 
  attr_accessor :secret_code
  attr_reader :mode

  def initialize(mode)
    @mode = mode
    @secret_code = []
  end

  def make_secret_code(color_pallette)
    # no repetition of the colors are allowed
    used_nums = [] 
    4.times do
      random_num = rand(color_pallette.length) 
      while used_nums.include?(random_num)
        random_num = rand(color_pallette.length)
      end 
      self.secret_code.push(color_pallette[random_num])
      used_nums.push(random_num)
    end
  end

  def give_feedback(chosen_colors)
    help_arr = check_right_color_and_pos(chosen_colors)
    number_ball_right_color_and_pos = help_arr.first
    right_indexes = help_arr.last
    number_ball_right_color = check_right_color(chosen_colors, right_indexes)
    return [number_ball_right_color_and_pos, number_ball_right_color]  
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
end