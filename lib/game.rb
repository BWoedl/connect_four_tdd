require_relative 'board'

class Game
  def initialize(board = Board.new)
    @board = board
  end

  def display
    p @board.spaces
    ## come back and fix this
  end
end
