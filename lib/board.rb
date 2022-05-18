require_relative 'player'

class Board
  attr_accessor :spaces

  AVAILABLE_ROWS = 'abcdef'

  def initialize(spaces = create_board)
    @spaces = spaces
  end

  def update_board(player, move)
    update = translate_input(player, move)
    @spaces[update[1][0]][update[1][1]] = update[0]
  end

  def translate_input(player, move)
    translation = [player.get_symbol]

    row = AVAILABLE_ROWS.index(move[0]).to_i
    column = move[1].to_i - 1
    translation << [row, column]
  end

  def create_board
    empty_board = []

    6.times do
      empty_board << ['','','','','','','']
    end
    empty_board
  end
end
