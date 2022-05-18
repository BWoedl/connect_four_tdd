require_relative 'board'

class Game
  def initialize(board = Board.new)
    @board = board
  end

  def display
    p @board.spaces
    ## come back and fix this
  end

  def game_over?(player1, player2)
    won?(player1) || won?(player2) || draw?
  end

  def won?(player)
    check_horizontal(player) || check_vertical(player)
  end

  def draw?
    @board.spaces.flatten.none?(&:empty?)
  end

  def check_horizontal(player, spaces = @board.spaces)
    symbol = player.get_symbol
    spaces.each do |row|
      i = 0
      4.times do
        return true if row[i] == symbol && row[i + 1] == symbol && row[i + 2] == symbol && row[i + 3] == symbol

        i += 1
      end
    end
    false
  end

  def check_vertical(player)
    transposed = @board.spaces.transpose
    check_horizontal(player, transposed)
  end

  def check_diagonal(player, lc = 0, lr = 0, rr = 0, rc = 6)
    symbol = player.get_symbol
    grid = @board.spaces

    3.times do
      4.times do
        return true if grid[lr][lc] == symbol && grid[lr + 1][lc + 1] == symbol && grid[lr + 2][lc + 2] == symbol && grid[lr + 3][lc + 3] == symbol
        return true if grid[rr][rc] == symbol && grid[rr + 1][rc - 1] == symbol && grid[rr + 2][rc - 2] == symbol && grid[rr + 3][rc - 3] == symbol

        lc += 1
        rc -= 1
      end
      lr += 1
      rr += 1
    end
    false
  end
end
