require_relative "./ball"

class CompPlayer 
  attr_accessor :secret_code
  attr_reader :mode, :all_pos_combinations, :first_guess

  def initialize(mode)
    @mode = mode
    @secret_code = []
    @all_pos_combinations = []
    6.times do |i1|
      6.times do |i2|
        6.times do |i3|
          6.times do |i4|
            @all_pos_combinations.push([i1,i2,i3,i4])
          end
        end
      end
    end
    @first_guess = [1,1,2,2]
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
    return self.secret_code
  end

  def make_guess(color_pallette, round)
    if round == 1
      return color_pallette.values_at(self.first_guess[0], self.first_guess[1], self.first_guess[2], self.first_guess[3])
    else



    color_pallette.values_at(0,1,2,3)
    end
  end
end