class Ball
=begin 
circled 
A : 24B6
B: 24B7
C: 24B8
D: 24B9
E: 24BA
F: 24BB

full black circle: 23FA

empty circle : 20DD
=end
  attr_accessor :symbol, :color_name

  def initialize(color_name)
    @symbol = "\u{23FA}".colorize(color_name)
    @color_name = color_name
  end
end