require './computer.rb'
require './human.rb'
class Gameboard
  attr_accessor :board, :turns

  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @turns = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def start_game(board, turns, player_1, player_2)  
    # puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    take_turn(board, turns, player)
     
    #   if @player_1.go_first == true
    #     @player_1.take_turn(@board, @turns, @player_1, @player_2)
    #     # binding.pry
    #     puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    #     @player_2.take_turn(@board, @turns, @player_2)
    #   else
    #     @player_2.take_turn(@board, @turns, @player_2)
    #     # binding.pry
    #     puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    #     @player_1.take_turn(@board, @turns, @player_1)
    #   end
    #   puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    # end
    puts "Game over"
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