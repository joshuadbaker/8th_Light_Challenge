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
          
          until @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1.game_symbol, @new_game.player_2.game_symbol)

            @new_game.turn_order.each do |player|

              @new_game.player = player
              if player == @new_game.player_1
                @new_game.opponent = @new_game.player_2
              else
                @new_game.opponent = @new_game.player_1
              end

              puts "Your turn, #{player.name}!"
              
              if player.is_a?(Computer)
                @new_game.get_best_move(@new_game.new_gameboard.board, 0, player, @new_game.player_1.game_symbol, @new_game.player_2.game_symbol)
                spot = @new_game.computer_move
                number = spot.to_i
              else
              
                spot = gets.chomp
                number = spot.to_i

                while @new_game.new_gameboard.board.include?(spot) == false
                  puts "Please enter a valid open space on the board, #{player.name}."
                  spot = gets.chomp
                  number = spot.to_i
                end
              end

              puts "#{player.name} moves to #{spot}."
              @new_game.take_turn(@new_game.new_gameboard.board, player, number)
              @new_game.new_gameboard.board[number] = player.game_symbol     
              puts "|_#{@new_game.new_gameboard.board[0]}_|_#{@new_game.new_gameboard.board[1]}_|_#{@new_game.new_gameboard.board[2]}_|\n|_#{@new_game.new_gameboard.board[3]}_|_#{@new_game.new_gameboard.board[4]}_|_#{@new_game.new_gameboard.board[5]}_|\n|_#{@new_game.new_gameboard.board[6]}_|_#{@new_game.new_gameboard.board[7]}_|_#{@new_game.new_gameboard.board[8]}_|\n"
              
              if @new_game.new_gameboard.tie(@new_game.new_gameboard.board, @new_game.player_1.game_symbol, @new_game.player_2.game_symbol)
                puts "It's a tie!"
                return @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1.game_symbol, @new_game.player_2.game_symbol)
              elsif @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1.game_symbol, @new_game.player_2.game_symbol)
                puts "#{player.name} wins!"
                return @new_game.new_gameboard.game_is_over(@new_game.new_gameboard.board, @new_game.player_1.game_symbol, @new_game.player_2.game_symbol)
              else
                # Notifies next player of where current player moved
                puts "#{player.name} moved to space #{number}."
              end
            end #turn_order each loop
          end # until loop for turn_order array
        end # until "q" loop
      end # if "s" condition    
    else
      # redirects user to correct entry in CLI 
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
        puts "You chose person vs computer, good luck!"
        game_version
      elsif game_version == 3
        puts "You chose computer vs. computer, enjoy the match!"
        game_version
      end
    else
      puts "Invalid entry, please enter 1, 2, or 3"
      select_version
    end  
  end

  def create_players
    new_game.player_array.each do |player|
      original_symbol = player.game_symbol
      if player.is_a?(Computer)
        if player.game_symbol == @new_game.player_1.game_symbol &&  @new_game.player_1.game_symbol == "X"
          player.game_symbol = "O"
        elsif player.game_symbol == @new_game.player_1.game_symbol &&  @new_game.player_1.game_symbol == "O"
          player.game_symbol = "X"
        end
        puts "I am #{player.name} and my game symbol is #{player.game_symbol}.  Good luck!"
      else
        puts "Please enter the name for #{player}."
        name = gets.chomp
        player.name = name
        puts "Please enter a single character as your game symbol(The game will default to #{player.game_symbol})"
        symbol = gets.chomp.upcase
        if player == @new_game.player_2
          while symbol == @new_game.player_1.game_symbol
            puts "Please enter a different symbol from #{@new_game.player_1}."
            symbol = gets.chomp.upcase
          end
          if symbol == "" && original_symbol == @new_game.player_1.game_symbol
            while symbol == "" 
              puts "Please enter a different symbol from #{@new_game.player_1}."
              symbol = gets.chomp.upcase
            end
            player.game_symbol = symbol
          elsif symbol == ""
            player.game_symbol = original_symbol
          else
            player.game_symbol = symbol
          end
          # binding.pry
        elsif symbol == ""
          player.game_symbol = original_symbol
        else
          player.game_symbol = symbol
        end
        puts "Your name is #{player.name} and your game symbol is #{player.game_symbol}."
      end
    end
  end

  def coin_toss
    puts "#{@new_game.player_1.name}, heads or tails?"
    if @new_game.player_1.is_a?(Computer)
      call = ["heads", "tails"].sample
      puts "#{@new_game.player_1.name} selects #{call}."
    else
      call = gets.chomp
      call.downcase
      # binding.pry
    end
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
end

console = Console.new
console.display_new_game