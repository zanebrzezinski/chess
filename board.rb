require_relative 'piece'
require_relative 'display'
require 'byebug'
require 'colorize'

class Board

  attr_reader :grid
  attr_accessor :display

  def initialize
    @grid = Array.new(8) {Array.new(8) {NullPiece.new } }
    @display = Display.new(self)
    populate
  end

  def populate
    grid.each_with_index do |row, row_index|
      row.each_with_index do |square, col_index|

        if row_index == 0
          pop_home_row([row_index, col_index], :black)
        elsif row_index == 1
          pop_pawns([row_index, col_index], :black)
        elsif row_index == 6
          pop_pawns([row_index, col_index], :white)
        elsif row_index == 7
          pop_home_row([row_index, col_index], :white)
        end

      end
    end
  end

  def pop_home_row(pos, color)
    if pos[1] == 0
      self[pos] = Rook.new(grid, color)
    elsif pos[1] == 1
      self[pos] = Knight.new(grid, color)
    elsif pos[1] == 2
      self[pos] = Bishop.new(grid, color)
    elsif pos[1] == 3
      self[pos] = Queen.new(grid, color)
    elsif pos[1] == 4
      self[pos] = King.new(grid, color)
    elsif pos[1] == 5
      self[pos] = Bishop.new(grid, color)
    elsif pos[1] == 6
      self[pos] = Knight.new(grid, color)
    elsif pos[1] == 7
      self[pos] = Rook.new(grid, color)
    end
  end

  def pop_pawns(pos, color)
    self[pos] = Pawn.new(grid, color)
  end


  def render
    @display.render
  end

  def move(start, end_pos)
    self[start].move(end_pos)
  end

  def rows
    @grid
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    grid[x][y] = piece
  end

  def in_bounds?(pos)
    pos.all? { |x| x.between?(0, 7) }
  end
end
