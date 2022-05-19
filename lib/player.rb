class Player
  attr_accessor :number
  attr_accessor :name

  def initialize(number = 1, name)
    @number = number
    @name = name
    @red = '🔴'
    @blue = '🔵'
  end

  def get_symbol
    @number == 1 ? @red : @blue
  end
end
