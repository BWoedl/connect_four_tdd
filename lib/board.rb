require_relative 'player'

class Board
  INITIAL_SPACES = [' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ',
                    ' ', ' ', ' ', ' ', ' ', ' ', ' ']

  AVAILABLE_ROWS = 'abcdef'

  attr_accessor :spaces

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
    symbol = player.number == 1 ? '🔴' : '🟣'
  end
end

# a1 = 0
# a2 = 1
# a3 = 2
# a4 = 3
# a5 = 4
# a6 = 5
# a7 = 6
# b1 = 7
# b2 = 8
# b3 = 9
# b4 = 10 
# b5 = 11 
# b6 = 12
# b7 = 13
# c1 = 14

