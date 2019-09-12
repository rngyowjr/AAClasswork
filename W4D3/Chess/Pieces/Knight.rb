require_relative "Piece.rb"
require_relative "Stepable.rb"

class Knight < Piece
  include Stepable

  def symbol
    
  end

  def move_diffs
    moves = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
    ]

    moves
  end
end

# Knight.new("white", b, [0,1])