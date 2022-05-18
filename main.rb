require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'

player = Player.new
board = Board.new
game = Game.new(board)

