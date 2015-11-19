require 'pry'
require './human.rb'
require './computer.rb'
require './gameboard.rb'
class Game
  attr_accessor :player_1, :player_2, :computer_move, :player, :opponent, :new_gameboard, :turn_order, :player_array, :potential_turns, :potential_gameboard
  def initialize()
    @player_1 = player_1
    @player_2 = player_2
    @computer_move = computer_move
    @player = player
    @opponent = opponent
    @new_gameboard = new_gameboard
    @player_array = []
    @turn_order = []
    @potential_turns = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    @potential_gameboard = ["0", "1", "2", "3", "4", "5", "6", "7", "8"]
  end

  def create_new_game
    @new_gameboard = Gameboard.new()  
  end

  # "model" side of logic for selection of game
  def select(selection_number)
    player_array = []
    computer_name = ["Hal", "Skynet"]
    if selection_number == 1
     @player_1 = Human.new("X")
     @player_array.push(@player_1)
     @player_2 = Human.new("O")
     @player_array.push(@player_2)
    elsif selection_number == 2
      @player_1 = Human.new("X")
      @player_array.push(@player_1)
      @player_2 = Computer.new(computer_name.sample, "O")
      @player_array.push(@player_2)
    else
      @player_1 = Computer.new(computer_name[0], "X")
      @player_array.push(@player_1)
      @player_2 = Computer.new(computer_name[1], "O")
      @player_array.push(@player_2)
    end  
  end

  # "model" side of logic for coin toss  
  def coin_toss
    if @player_1.go_first == true
      @player_1.go_first = true
      @turn_order.push(@player_1)
      @turn_order.push(@player_2)
    else
      @player_2.go_first = true
      @turn_order.push(@player_2)
      @turn_order.push(@player_1)
    end  
  end

  # selects spot on board and attaches it to the player
  def take_turn(board, player, number)
    board[number] = player.game_symbol
  end

  # Check for a winning play for the minimax method
  def wins(player, board, player_1_game_symbol, player_2_game_symbol)
    if player && @new_gameboard.game_is_over(board, player_1_game_symbol, player_2_game_symbol)
      return true
    end
  end

  # Assesses a move and attaches a value to it based on its condition for the minimax method
  def move_assessment(depth, player, board, player_1_game_symbol, player_2_game_symbol)
    if wins(@player, board, player_1_game_symbol, player_2_game_symbol)
      return 10 - depth
    elsif wins(@opponent, board, player_1_game_symbol, player_2_game_symbol)
      return depth - 10
    else
      return 0
    end
  end

  # minimax method to check for best move for a computer move
  def get_best_move(board, depth, player, player_1_game_symbol, player_2_game_symbol)
    # Checks for a value of a move
    if new_gameboard.game_is_over(board, @player_1_game_symbol, @player_2_game_symbol)
      return move_assessment(depth, player, board, player_1_game_symbol, player_2_game_symbol) 
    end

    # depth keeps numerical value of the moves until the game ends
    depth += 1

    # stores the scores from the move_assessment method
    scores = []

    # stores the possible moves
    moves = []
    
    # potnetial_turns array keeps track of turns inside of the minimax method
    @potential_turns.each do |move|
      # passes in potential_gameboard array to check for potential moves
      take_turn(potential_gameboard, player, move)

      # store potential_gameboard in outcome variable
      outcome = potential_gameboard

      # delete move from potential_turns array
      potential_turns.delete(move)

      # recursion of the get_best_move method occurs below and the result is pushed into the scores array
      scores.push(get_best_move(outcome, depth, player, player_1_game_symbol, player_2_game_symbol))

      # Collects moves
      moves.push(move)
    end

    # Based on player during each state, assigns the scores to winning scores or scores to prevent loss
    # It is here that I ran into trouble with the moves array running out of moves and one turn from each player
    # Also inside of this method I encountered the issues with pry in terminal
    if player == @player
      max_score_index = scores.each_with_index.max[1]
      @computer_move = moves[max_score_index]
      return scores[max_score_index]
    else
      min_score_index = scores.each_with_index.min[1]
      @computer_move = moves[min_score_index]
      return scores[min_score_index]
    end
  end
end


