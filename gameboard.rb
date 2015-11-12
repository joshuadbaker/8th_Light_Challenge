require 'pry'
require './computer.rb'
require './human.rb'
class Gameboard
  attr_accessor :board, :turns

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @turns = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def game_is_over(board, player_1_game_symbol, player_2_game_symbol)
    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1 ||

    board.all? { |space| space == player_1_game_symbol || space == player_2_game_symbol}
  end
end