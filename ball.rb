# frozen_string_literal: true

class Ball
  #
  # circled
  # A : 24B6
  # B: 24B7
  # C: 24B8
  # D: 24B9
  # E: 24BA
  # F: 24BB
  #
  # full black circle: 23FA
  #
  # empty circle : 20DD
  attr_accessor :symbol, :color_name

  def initialize(color_name)
    @symbol = "\u{23FA}".colorize(color_name)
    @color_name = color_name
  end
end
