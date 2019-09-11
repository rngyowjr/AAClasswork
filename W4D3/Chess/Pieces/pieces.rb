require_relative "King.rb"
require_relative "Queen.rb"
require_relative "Bishop.rb"
require_relative "Knight.rb"
require_relative "Rook.rb"
require_relative "Pawn.rb"
require_relative "Null.rb"
require_relative "Slidable.rb"
require_relative "Stepable.rb"

class Piece
  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
    possible_moves = []
    x, y = self.pos
    MOVES.each do |(dx, dy)|
      new_pos = [x + dx, y + dy]
      if new_pos.between?(0, 7) || @board[new_pos] == @sentinel
        possible_moves << new_pos
      end
    end

    possible_moves
  end

  def pos=(val)
  end

  def symbol
  end

  private
  
  def move_into_check?(end_pos)
  end

end
