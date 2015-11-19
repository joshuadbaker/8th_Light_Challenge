require 'pry'
class Human
  attr_accessor :name, :game_symbol, :go_first
  
  def initialize(game_symbol)
    @name = name
    @game_symbol = game_symbol

    # The instance variable below is used in the coin_toss method to check for who goes first.
    @go_first = false
  end
end