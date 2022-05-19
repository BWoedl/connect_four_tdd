require_relative 'board'

class Game

  attr_accessor :turn 

  def initialize(board = Board.new, player1, player2)
    @board = board
    @turn = 0
    @player1 = player1
    @player2 = player2
  end

  def player_turn
    @turn.odd? ? @player1 : @player2
  end

  def take_turn
    display
    input = move
    if valid_move?(input)
      @board.update_board(player_turn, input)
      @turn += 1
    else
      puts "Try again with a valid number!\n"
    end
  end

  def move
    puts "\n#{player_turn.name}, please indicate which space you'd like to take.\nColumns are 1-7. \n"
    gets.chomp.to_i - 1
  end

  def valid_move?(input)
    input.between?(0, 6) && @board.open_space?(input)
  end

  def play
    take_turn until game_over?(@player1, @player2)
    game_end
  end

  def game_end
    puts draw? ? "\nIt's a draw! Play again." : "\n#{player_turn.name}! You won, woot woot\n\n"
    display
  end

  def display
    @board.spaces.each do |row|
      line = ''
      row.each do |space|
        space.empty? ? line += '|  ' : line += "|#{space}"
      end
      puts "#{line}|\n----------------------"
    end
  end

  def game_over?(player1, player2)
    won?(player1) || won?(player2) || draw?
  end

  def won?(player)
    check_horizontal(player) || check_vertical(player) || check_diagonal(player)
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
    transposed = @board.spaces[0].zip(* @board.spaces[1..-1])
    check_horizontal(player, transposed)
  end

  def check_diagonal(player, lr = 0, rr = 0)
    symbol = player.get_symbol
    grid = @board.spaces

    3.times do
      lc = 0
      rc = 6
      4.times do
        left_spots = [grid[lr][lc], grid[lr + 1][lc + 1], grid[lr + 2][lc + 2], grid[lr + 3][lc + 3]]
        right_spots = [grid[rr][rc], grid[rr + 1][rc - 1], grid[rr + 2][lc - 2], grid[rr + 3][rc - 3]]
        return true if left_spots.all? { |spot| spot == symbol }
        return true if right_spots.all? { |spot| spot == symbol }

        lc += 1
        rc -= 1
      end
      lr += 1
      rr += 1
    end
    false
  end
end
