require 'pry'
# require './gameboard.rb'

class Human
  attr_accessor :name, :game_symbol, :go_first
  
  def initialize()
    @name = name
    @game_symbol = game_symbol
    @go_first = false
  end
end