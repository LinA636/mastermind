require_relative "./ball"

class CompPlayer 
  attr_accessor :secret_code, :made_guesses
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
    @made_guesses = []
  end

  def make_secret_code()
    # no repetition of the colors are allowed
    choose_from = [1,2,3,4,5,6]
    used_nums = [] 
    4.times do
      random_num = choose_from[rand(choose_from.length)]  
      used_nums.push(random_num)
      choose_from.delete(random_num)
    end
    return used_nums
  end
 
  def make_guess()
    rand_num = rand(self.all_pos_combinations.length)
    rand_code = self.all_pos_combinations[rand_num]
    while self.made_guesses.include?(rand_code)
      rand_num = rand(self.all_pos_combinations.length)
      rand_code = self.all_pos_combinations[rand_num]
    end
    self.made_guesses.push(rand_code)
    return rand_code
  end

  def get_random_code_indexes()
    retrun self.all_pos_combinations(rand(self.all_pos_combinations.length))
  end
end