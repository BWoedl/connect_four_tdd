class Board
  attr_accessor :spaces

  def initialize(spaces = create_board)
    @spaces = spaces
  end

  def update_board(player, move)
    row_index = find_row(move)
    @spaces[row_index][move] = player.get_symbol
  end

  def find_row(move)
    (@spaces.size - 1).downto(0) do |row|
      return row if @spaces[row][move] == ''
    end
  end

  def open_space?(move)
    (@spaces.size - 1).downto(0) do |row|
      return true if @spaces[row][move] == ''
    end
    false
  end

  def create_board
    empty_board = []

    6.times do
      empty_board << ['', '', '', '', '', '', '']
    end
    empty_board
  end
end
