class Player
  attr_accessor :number

  def initialize(number = 1)
    @number = number
    @red = '🔴'
    @blue = '🔵'
  end

  def get_symbol
    @number == 1 ? @red : @purple
  end
end
