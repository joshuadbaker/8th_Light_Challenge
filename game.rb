# Notes from Jacob
# create console file separate puts to that file
# set gameboard[0] to an id
# move turn logic back to game file
# refactor into a single take_turn method apply it to each player/remove conditions from method
# assess whether I need the turns array
# refactor computer logic to a more basic rule for "best move"
# move tie into game_is_over method as a condition
# move versions into select_version
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
    # select(game_version)
    # coin_toss
    
  end

  def select(selection_number)
    # binding.pry
    if selection_number == 1
     @player_1 = Human.new()
     @player_2 = Human.new()
    elsif selection_number == 2
      @player_1 = Human.new()
      @player_2 = Computer.new()
    else
      @player_1 = Computer.new()
      @player_2 = Computer.new()
    end
  end

  def coin_toss
    if @player_1.go_first == true
      @player_1.go_first = true
    else
      @player_2.go_first = true
    end  
  end

  def take_turn(board, turns, player)
    spot = nil
    # open_spaces = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    until spot
      spot = gets.chomp
      number = spot.to_i
      if turns.include?(spot)
        turns.delete(spot)
        board[number] = player.id 
        # open_spaces.delete(number)
        # binding.pry    
        take_turn(player)
        spot = nil
      else
        puts "Please enter a valid open space on the board!"
        take_turn(board, turns, player_1, player_2)
      end
    end
  end
end


