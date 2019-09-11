class Knight < Pieces
  include Stepable

  def initialize

  end

  def symbol
    
  end

  def move_diffs
    MOVES = [
    [-2, -1],
    [-2,  1],
    [-1, -2],
    [-1,  2],
    [ 1, -2],
    [ 1,  2],
    [ 2, -1],
    [ 2,  1]
    ]

    MOVES
  end
end