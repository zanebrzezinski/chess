module Stepping

end

module Sliding

end

class Piece

  attr_reader :board, :color

  def initialize(board, color)
    @board = board
    @color = color
  end

  def move(pos)

  end

  def valid_move?

  end

  def to_s
    # byebug
    " #{self.class::CHAR[self.color]} "
  end




end

class NullPiece
  def present?
    false
  end

  def to_s
    "   "
  end

end



class Rook < Piece
  include Sliding
  CHAR = {
    white: "\u2656",
    black: "\u265C",
  }
end

class Bishop < Piece
  include Sliding
  CHAR = {
    white: "\u2657",
    black: "\u265D",
  }
end

class Queen < Piece
  include Sliding
  CHAR = {
    white: "\u2655",
    black: "\u265B",
  }
end

class King < Piece
  include Stepping
  CHAR = {
    white: "\u2654",
    black: "\u265A",
  }
end

class Knight < Piece
  include Stepping
  CHAR = {
    white: "\u2658",
    black: "\u265E",
  }
end


class Pawn < Piece

  include Stepping
  CHAR = {
    white: "\u2659",
    black: "\u265F",
  }
end
