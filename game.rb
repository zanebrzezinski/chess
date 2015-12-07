require_relative 'board'

class Game

  attr_reader :board

  def initialize
    @board = Board.new
    play
  end

  def play
    result = nil
    until over?
      board.render
      result = board.display.get_input

      
    end
  end

  def over?
    false

  end

end

g = Game.new
