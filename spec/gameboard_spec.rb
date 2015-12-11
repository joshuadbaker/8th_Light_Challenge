require 'spec_helper'
require 'pry'
describe Gameboard do
  describe "attributes" do
    subject do
      Gameboard.new(:board => "['0', '1', '2', '3', '4', '5', '6', '7', '8']")
    end
    it { is_expected.to respond_to(:board) }
  end

  let(:new_game) do
    Gameboard.new(:board => "['0', '1', '2', '3', '4', '5', '6', '7', '8']")    
  end

 describe "#game_is_over" do
    context "board values" do
      context "given 'new_game.board[0] = X, new_game.board[1] = X, new_game.board[2] = X'"
       it "returns true" do
        binding.pry
        expect(new_game.game_is_over(new_game.board, "X", "O")).to eq(true)
      end
    end
 end 
end