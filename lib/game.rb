require_relative 'board'

class Game
  def initialize(board = Board.new)
    @board = board
  end

  def display
    p @board.spaces
  end
end
