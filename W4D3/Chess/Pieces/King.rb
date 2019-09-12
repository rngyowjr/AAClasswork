require_relative "Piece.rb"
require_relative "Stepable.rb"

class King < Piece
  include Stepable

  def symbol
    
  end

  def move_diffs
    moves = [
    [ 1, 0],
    [ 1, -1],
    [ 0, -1],
    [-1, -1],
    [-1, 0],
    [-1, 1],
    [ 0, 1],
    [ 1, 1]
    ]

    moves
  end
end