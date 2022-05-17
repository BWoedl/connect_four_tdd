require_relative 'player'

class Board
  attr_accessor :spaces

  INITIAL_SPACES = [' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ']

  AVAILABLE_ROWS = 'abcdef'

  def initialize(spaces = INITIAL_SPACES)
    @spaces = spaces
  end

  def update_board(player, move)
    update = translate_input(player, move)
    @spaces[update[1]] = update[0]
  end

  def translate_input(player, move)
    translation = [get_player_symbol(player)]

    row = AVAILABLE_ROWS.index(move[0]).to_i
    column = move[1].to_i
    translation << row * 7 + column - 1
  end

  def get_player_symbol(player)
    player.number == 1 ? '🔴' : '🟣'
  end
end
