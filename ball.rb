# frozen_string_literal: true

class Ball
  attr_accessor :symbol, :color_name, :id

  def initialize(color_name, id)
    @symbol = "\u{23FA}".colorize(color_name)
    @color_name = color_name
    @id = id
  end
end
