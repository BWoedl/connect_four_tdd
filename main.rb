require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'

player = Player.new
game = Game.new
board = Board.new

board.update_board(player, 'a4')
#   