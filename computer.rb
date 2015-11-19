require 'pry'
require './gameboard.rb'

class Computer
  attr_accessor :name, :game_symbol, :go_first

  def initialize(name, game_symbol)
    @name = name
    @game_symbol = game_symbol
    @go_first = false
  end

  # The code below was from my intital work to meet all of the basic requirements of functionalty for the computer
  # I thought I would use that logic here, but ended up moving this logic to the game.rb file
  # It was also here that I decided to pursue a different solution to the logic for the computer moves and left this as is and
  # focused on the minimax algorithim.  Much of what is below is still hard coded and does not reflect the console.rb file

  # def eval_board
  #   binding.pry
  #   spot = nil
  #   my_move = spot
  #   until spot
  #     if @board[4] == "X" && @board[0] == "O" || @board[4] == "O" && @board[0] == "X" || @board[4] == "X" && @board[0] == "X"
  #       spot = get_best_move(@board, @computer)
  #       if @board[spot] != "X" && @board[spot] != "O"
  #         my_move = spot
  #         @board[spot] = @computer
  #       end
  #     elsif @board[4] == "X" && @board[0] == "X"
  #       if @board[8] == "8"
  #         spot = 8
  #         my_move = spot
  #         @board[spot] = @computer
  #         # puts "I win!"
  #       elsif @board[8] == "O"
  #         spot = checkmate(@board)
  #         @board[spot] = @computer
  #         puts "That's checkmate bruh!"
  #       end
  #     elsif @board[4] == "X"
  #       if second_move(@board)
  #         spot = second_move(@board)
  #         my_move = spot
  #         @board[spot] = @computer
  #       else
  #         spot = 0
  #         my_move = spot
  #         @board[spot] = "X"
  #       end        
  #     elsif @board[4] == "4"
  #       spot = 4
  #       my_move = spot
  #       @board[spot] = @computer 
  #     else
  #       spot = nil
  #     end 
  #     # binding.pry
  #     return my_move   
  #   end
  # end

  # def computer_went_first(board)
  #   eight = [2, 6]
  #   two = [0, 8]
  #   zero = [2, 8]
  #   if board[4] == "X" && board.count("X") == 1 && board.count("O") == 1
  #     if board[8] == "O"
  #       return eight.sample
  #     elsif board[2] == "O"
  #       return two.sample
  #     elsif board[0] == "O"
  #       return zero.sample
  #     end
  #   else

  #   end
  # end
  # def second_move(board)
  #   column_3 = [board[2], board[5], board[8]]
  #   row_3 = [board[6], board[7], board[8]]
  #   row_2 = [board[0], board[1], board[2]]
  #   # best_move = nil

  #   if column_3.count("O") == 2 || row_3.count("O") == 2
  #     return get_best_move(@board, @computer)
  #   end
  # end

  # def checkmate(board)
  #   column_1 = [board[0], board[3], board[6]]
  #   column_2 = [board[1], board[4], board[7]]
  #   row_1 = [board[0], board[1], board[2]]
  #   row_2 = [board[0], board[1], board[2]]
  #   diagonal_1 = [board[2], board[4], board[6]]
  #   best_move = nil

  #   if column_1.include?("1") && column_1.include?("2") && row_2.include?("3") && row_2.include?("5")
  #     best_move = board[3].to_i
  #   elsif column_1.include?("1") && column_1.include?("2") && diagonal_1.include?("2") && row_2.include?("6")
  #     best_move = board[6]
  #   end
  #   if best_move
  #     return best_move
  #   end
  # end

  # def get_best_move(board, next_player, depth = 0, best_score = {})
  #   open_spaces = []
  #   best_move = nil
  #   board.each do |space|
  #     if space != "X" && space != "O"
  #       open_spaces << space
  #     end
  #   end
  #   open_spaces.each do |open_space|
  #     board[open_space.to_i] = @computer
  #     if game_is_over(board)
  #       best_move = open_space.to_i
  #       board[open_space.to_i] = open_space
  #       return best_move
  #     else
  #       board[open_space.to_i] = @human
  #       if game_is_over(board)
  #         best_move = open_space.to_i
  #         board[open_space.to_i] = open_space
  #         return best_move
  #       else
  #         board[open_space.to_i] = open_space
  #       end
  #     end
  #   end
  #   if best_move
  #     return best_move
  #   else
  #     n = rand(0..open_spaces.count)
  #     return open_spaces[n].to_i
  #   end
  # end
end