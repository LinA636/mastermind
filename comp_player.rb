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
      random_num = rand(color_pallette.length); 
      while used_nums.include?(random_num)
        random_num = rand(color_pallette.length); 
      end 
      self.secret_code.push(color_pallette[random_num])
      used_nums.push(random_num)
    end
  end
end