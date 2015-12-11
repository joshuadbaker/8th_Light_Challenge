require 'pry'
# require './computer.rb'
require './human.rb'
class Gameboard
  attr_accessor :board

  def initialize(board)
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def game_is_over(board, player_1_game_symbol, player_2_game_symbol)
    win_array = [[board[0], board[1], board[2]], [board[3], board[4], board[5]], [board[6], board[7], board[8]], [board[0], board[3], board[6]], [board[1], board[4], board[7]], [board[2], board[5], board[8]], [board[0], board[4], board[8]], [board[2], board[4], board[6]]]
    win_array.detect do |win|
      win.uniq.length == 1
    end
  end

  def tie(board, player_1_game_symbol, player_2_game_symbol)
    board.all? { |space| space == player_1_game_symbol || space == player_2_game_symbol}
  end
end