require 'pry'
class Game
  def initialize
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @turns = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @computer = "X"
    @human = "O"
  end

  def start_game
    puts "Welcome to my Tic Tac Toe game"
    puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    puts "You go first, please select your space."
    until game_is_over(@board) || tie(@board)
      get_human_spot
      eval_board
      puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    end
    puts "Game over"
  end
  def get_human_spot
    spot = nil
    open_spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    until spot
      spot = gets.chomp
      number = spot.to_i
      if @turns.include?(spot)
        @turns.delete(spot)
        @board[number] = @human
        open_spaces.delete(number)
        return spot = nil
      else
        puts "Please enter a valid open space on the board!"
        get_human_spot
      end
    end
  end

  def eval_board
    spot = nil
    my_move = spot
    until spot
      if @board[4] == "X" && @board[0] == "O" || @board[4] == "O" && @board[0] == "X" || @board[4] == "X" && @board[0] == "X"
        spot = get_best_move(@board, @computer)
        if @board[spot] != "X" && @board[spot] != "O"
          my_move = spot
          @board[spot] = @computer
        end
      elsif @board[4] == "4"
        spot = 4
        my_move = spot
        @board[spot] = @computer 
        # puts "My move was to space #{my_move}. Your turn!"
        # spot = nil
      elsif @board[0] == "0"
        spot = 0
        my_move = spot
        @board[spot] = @computer 
        # puts "My move was to space #{my_move}. Your turn!" 
        # spot = nil
      else
        spot = nil
      end 
      # binding.pry
      puts "My move was to space #{my_move}. Your turn!"    
    end
  end

  def get_best_move(board, next_player, depth = 0, best_score = {})
    available_spaces = []
    best_move = nil
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces.each do |as|
      board[as.to_i] = @computer
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        board[as.to_i] = @human
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end
    if best_move
      return best_move
    else
      n = rand(0..available_spaces.count)
      return available_spaces[n].to_i
    end
  end

  def game_is_over(b)

    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

end

game = Game.new
game.start_game
