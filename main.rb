require_relative 'lib/game'
require_relative 'lib/board'
require_relative 'lib/player'

def start_game
  players = create_players
  while create_new_game?
    game = Game.new(Board.new, players[0], players[1])
    game.play
  end
  puts 'See you next time!'
end

def create_players
  puts "\nHi player 1, what's your name?\n"
  player1 = Player.new(1, gets.chomp)
  puts "\nHi player 2, what's your name?\n"
  player2 = Player.new(2, gets.chomp)
  players = [player1, player2]
end

def create_new_game?
  puts "\n\n\nWould you like to play a new Connect Four game? Type either y or n"
  input = gets.chomp
  input == 'y'
end

start_game