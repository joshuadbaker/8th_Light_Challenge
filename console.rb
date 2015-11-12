require('pry')
require('./game.rb')
require('./gameboard.rb')
class Console
  attr_accessor :view, :new_game
  def initialize()
    @view = view
    @new_game = new_game
  end

  puts "Hello..."
  # sleep(2)
  puts "...Dave"
  # sleep(1)
  puts "Welcome to Tic Tac Toe!"
  # sleep(1)  

  def display_new_game
    @new_game = Game.new
    puts "Select from the following options and only type the first letter not the whole word\n(s)tart game\n(q)uit Tic Tac Toe"
    response = gets.chomp
    response = response.downcase
    if response == "s" || response == "q"
      if response == "s"
        until response == "q"
          selection_number = select_version
          @new_game.select(selection_number)
          create_players
          coin_toss
          @new_game.create_new_game
          puts "|_#{@new_game.new_gameboard.board[0]}_|_#{@new_game.new_gameboard.board[1]}_|_#{@new_game.new_gameboard.board[2]}_|\n|_#{@new_game.new_gameboard.board[3]}_|_#{@new_game.new_gameboard.board[4]}_|_#{@new_game.new_gameboard.board[5]}_|\n|_#{@new_game.new_gameboard.board[6]}_|_#{@new_game.new_gameboard.board[7]}_|_#{@new_game.new_gameboard.board[8]}_|\n" 
          
          # Player turns with until loop checking for winning move
          until @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1, @new_game.player_2)
            @new_game.turn_order.each do |player|
              puts "Your turn, #{player.name}!"
              spot = gets.chomp
              number = spot.to_i

              # checks for invalid entry on gameboard
              while @new_game.new_gameboard.turns.include?(spot) == false
                puts "Please enter a valid open space on the board, #{player.name}."
                spot = gets.chomp
                number = spot.to_i
              end

              # player move
              @new_game.new_gameboard.turns.delete(spot)
              @new_game.take_turn(player, @new_game.new_gameboard.board, number)       
              puts "|_#{@new_game.new_gameboard.board[0]}_|_#{@new_game.new_gameboard.board[1]}_|_#{@new_game.new_gameboard.board[2]}_|\n|_#{@new_game.new_gameboard.board[3]}_|_#{@new_game.new_gameboard.board[4]}_|_#{@new_game.new_gameboard.board[5]}_|\n|_#{@new_game.new_gameboard.board[6]}_|_#{@new_game.new_gameboard.board[7]}_|_#{@new_game.new_gameboard.board[8]}_|\n"
              
              # checks for winning move
              if @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1, @new_game.player_2)
                puts "#{player.name} wins!"
                return @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1, @new_game.player_2)
              else
                puts "#{player.name} moved to space #{number}."
              end
            end #turn_order each loop
          end # until loop for turn_order array
        end # until "q" loop
      end # if "s" condition    
    else 
      puts "Please enter a valid command with the first letter."
      display_new_game
    end
  end

  def select_version
    puts "Select number for version of game:\n 1. Person vs. Person\n 2. Person vs. Computer\n 3. Computer vs. Computer"
    game_version = gets.chomp
    game_version = game_version.to_i
    if game_version == 1 || game_version == 2 || game_version == 3
      if game_version == 1
        puts "You chose person vs person!"
        game_version
      elsif game_version == 2
        puts "You chose person vs computer, good luck against Hal!"
        @new_game.select(game_version)
      elsif game_version == 3
        puts "Hal vs Skynet"
        @new_game.select(game_version) 
      end
    else
      puts "Invalid entry, please enter 1, 2, or 3"
      select_version
    end  
  end

  def create_players
    binding.pry
    new_game.player_array.each do |player|
      puts "Please enter the name for #{player}."
      name = gets.chomp
      player.name = name
      puts "Please enter a single character as your game symbol(The game will default to #{player.game_symbol})"
      symbol = gets.chomp
      if symbol == ""
        player.game_symbol = player.game_symbol
      end
      puts "Your name is #{player.name} and your game symbol is #{player.game_symbol}."
    end
  end

  def coin_toss
    puts "#{@new_game.player_1.name}, heads or tails?"
    call = gets.chomp
    call.downcase
    if call == "heads"
      coin = rand(1..2)
      call = 1
      if call == coin
        @new_game.player_1.go_first = true
        puts "#{@new_game.player_1.name} won the toss."
      else
        @new_game.player_2.go_first = true
        puts "#{@new_game.player_2.name} won the toss." 
        # eval_board
      end
    elsif call == "tails"
      coin = rand(1..2)
      call = 2
      if call == coin
        @new_game.player_1.go_first = true
         puts "#{@new_game.player_1.name} won the toss."
      else
        @new_game.player_2.go_first = true
        puts "#{@new_game.player_2.name} won the toss." 
        # eval_board
      end
    else
      puts "Invalid answer"
      coin_toss
    end
    @new_game.coin_toss
  end

  def start_game(board, player_1, player_2)
  end
  # def play_again
  #   puts "Play again? (Y)es or (N)o"
  #   answer = gets.chomp
  #   answer.downcase
  #   if answer == 'y'
  #     display_new_game
  #   else
  #     abort("Thanks for playing!")
  #   end
  # end
end

console = Console.new
console.display_new_game