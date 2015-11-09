require 'pry'
require './human.rb'
require './computer.rb'
require './gameboard.rb'
class Game
  attr_accessor :player_1, :player_2, :new_gameboard
  def initialize()
    @player_1 = player_1
    @player_2 = player_2
    @new_gameboard = new_gameboard
  end

  def create_new_game
    @new_gameboard = Gameboard.new()
    puts "Hello..."
    # sleep(2)
    puts "...Dave"
    # sleep(1)
    puts "Welcome to Tic Tac Toe!"
    # sleep(1)  
    puts "Select from the following options and only type the first letter not the whole word\n(s)tart game\n(q)uit Tic Tac Toe"
    response = gets.chomp
    response = response.downcase
    if response == "s" || response == "q"
      until response == "q"
        if response == "s"
          select_version     
        end
        coin_toss
        @new_gameboard.take_turn(@new_gameboard.board, @new_gameboard.turns, @player_1, @player_2) 
      end
    else 
      puts "Please enter a valid command with the first letter."
      sleep(1)
      create_new_game
    end
  end

  def select_version
    puts "Select number for version of game:\n 1. Person vs. Person\n 2. Person vs. Computer\n 3. Computer vs. Computer"
    game_version = gets.chomp
    game_version = game_version.to_i
    if game_version == 1
      puts "You chose person vs person!"
      person_vs_person
    elsif game_version == 2
      puts "You chose person vs computer, good luck against Hal!"
      person_vs_computer
    elsif game_version == 3
      puts "Hal vs Skynet"
    else 
      abort("Thank you for playing!")
    end
  end

  def person_vs_person
    puts "Please enter the name for player 1."
    name_1 = gets.chomp
    puts 'Please enter a single character as your game symbol(The game will default to "X")'
    # binding.pry
    symbol_1 = gets.chomp
    @player_1 = Human.new(name_1, symbol_1)
    sleep(1)
    puts "Thank you, your name is #{@player_1.name} and your game symbol is #{@player_1.game_symbol}"
    
    puts "Please enter the name for player 2."
    name_2 = gets.chomp
    puts 'Please enter a single character as your game symbol(The game will default to "X")'
    symbol_2 = gets.chomp
    @player_2 = Human.new(name_2, symbol_2)
    sleep(1)
    puts "Thank you, your name is #{@player_2.name} and your game symbol is #{@player_2.game_symbol}"
  end

  def person_vs_computer
    puts "Please enter the name for player 1."
    name_1 = gets.chomp
    puts 'Please enter a single character as your game symbol(The game will default to "X")'
    symbol_1 = gets.chomp
    @player_1 = Human.new(name_1, symbol_1)
    # create_person(@player_1, name_1, symbol_1)
    sleep(1)
    @player_2 = Computer.new(name, game_symbol)
    puts "Thank you, you name is #{@player_1.name} and you game symbol is #{@player_1.game_symbol}.  Good luck beating #{@player_2.name}!  Hal's game symbol is #{@player_2.game_symbol}"
  end

  def computer_vs_computer
  end

  def coin_toss
    puts "#{@player_1.name}, heads or tails?"
    call = gets.chomp
    call.downcase
    if call == "heads"
      coin = rand(1..2)
      call = 1
      if call == coin
        @player_1.go_first = true
        puts "#{@player_1.name} won the toss. Please select your space."
      else
        @player_2.go_first = true
        puts "#{@player_2.name} won the toss.  #{player_2.name} make your move." 
        # eval_board
      end
    elsif call == "tails"
      coin = rand(1..2)
      call = 2
      if call == coin
        @player_1.go_first = true
         puts "#{@player_1.name} won the toss. Please select your space."
      else
        @player_2.go_first = true
        puts "#{@player_2.name} won the toss, get ready to loose...Dave" 
        # eval_board
      end
    else
      puts "Invalid answer"
      coin_toss
    end  
  end
end

game = Game.new
game.create_new_game
