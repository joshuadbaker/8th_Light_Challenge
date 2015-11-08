require 'pry'
require './human.rb'
class Game
  attr_accessor :board, :turns, :player_1, :player_2
  def initialize()
    @board = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @turns = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
    @player_1 = player_1
    @player_2 = player_2
  end

  def start_game
    puts "Hello..."
    # sleep(2)
    puts "...Dave"
    # sleep(1)
    puts "Welcome to Tic Tac Toe!"
    # sleep(1)
    create_new_game
    if game_version == 1    
      coin_toss
    elsif game_version == 2
      coin_toss
    elsif game_version == 3
      coin_toss
    else
      create_new_game
    end 
    puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    until game_is_over(@board) || tie(@board)
      get_human_spot
      eval_board
      puts "|_#{@board[0]}_|_#{@board[1]}_|_#{@board[2]}_|\n|_#{@board[3]}_|_#{@board[4]}_|_#{@board[5]}_|\n|_#{@board[6]}_|_#{@board[7]}_|_#{@board[8]}_|\n"
    end
    puts "Game over"
  end

  def create_new_game  
    puts "Select from the following options and only type the first letter not the whole word\n(s)tart game\n(q)uit Tic Tac Toe"
    response = gets.chomp
    response = response.downcase
    if response == "s" || response == "q"
      until response == "q"
        if response == "s"
          puts "Select number for version of game:\n 1. Person vs. Person\n 2. Person vs. Computer\n 3. Computer vs. Computer"
          game_version = gets.chomp
          game_version = game_version.to_i
          if game_version == 1
            puts "You chose person vs person!"
          elsif game_version == 2
            puts "person vs Hal"
          elsif game_version == 3
            puts "Hal vs Skynet"
          else 
            abort("Thank you for playing!")
          end    
        end
        game_version
      end
    else 
      puts "Please enter a valid command with the first letter."
      sleep(1)
      create_new_game
    end 
  end

  def person_vs_person
    puts "Please enter the name for player 1."
    name_1 = gets.chomp
    puts 'Please enter a single character as your game symbol(The game will default to "X")'
    symbol_1 = gets.chomp
    @player_1 = Human.new(name_1, symbol_1)
    # create_person(@player_1, name_1, symbol_1)
    sleep(1)
    puts "Thank you, you name is #{@player_1.name} and you game symbol is #{@player_1.game_symbol}"
    
    puts "Please enter the name for player 2."
    name_2 = gets.chomp
    puts 'Please enter a single character as your game symbol(The game will default to "X")'
    symbol_2 = gets.chomp
    @player_2 = Human.new(name_2, symbol_2)
    sleep(1)
    puts "Thank you, you name is #{@player_2.name} and you game symbol is #{@player_2.game_symbol}"
  end


  def coin_toss
    puts "#{@player_1.name}, heads or tails?"
    call = gets.chomp
    call.downcase
    if call == "heads"
      coin = rand(1..2)
      call = 1
      if call == coin
        puts "#{@player_1.name} won the toss. Please select your space."
      else
        puts "#{@player_2.name} won the toss" 
        # eval_board
      end
    elsif call == "tails"
      coin = rand(1..2)
      call = 2
      if call == coin
         puts "#{@player_1.name} won the toss. Please select your space."
      else
        puts "#{@player_2.name} won the toss, get ready to loose...Dave" 
        # eval_board
      end
    else
      puts "Invalid answer, heads or tails?"
      coin_toss
    end   
  end
  # def get_human_spot
  #   spot = nil
  #   open_spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  #   until spot
  #     spot = gets.chomp
  #     number = spot.to_i
  #     if @turns.include?(spot)
  #       @turns.delete(spot)
  #       @board[number] = @human
  #       open_spaces.delete(number)
  #       return spot = nil
  #     else
  #       puts "Please enter a valid open space on the board!"
  #       get_human_spot
  #     end
  #   end
  # end

  # def eval_board
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
  #     puts "My move was to space #{my_move}. Your turn!"    
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

  def game_is_over(board)

    [board[0], board[1], board[2]].uniq.length == 1 ||
    [board[3], board[4], board[5]].uniq.length == 1 ||
    [board[6], board[7], board[8]].uniq.length == 1 ||
    [board[0], board[3], board[6]].uniq.length == 1 ||
    [board[1], board[4], board[7]].uniq.length == 1 ||
    [board[2], board[5], board[8]].uniq.length == 1 ||
    [board[0], board[4], board[8]].uniq.length == 1 ||
    [board[2], board[4], board[6]].uniq.length == 1
  end

  def tie(board)
    board.all? { |space| space == "X" || space == "O" }
  end

end

game = Game.new
game.start_game
