require_relative "Piece.rb"
require_relative "Slideable.rb"

class Rook < Piece
  include Slideable

  def symbol
    
  end

  def move_diffs
    # slide_moves = []
    hi = moves
    # grow_unblocked_in_dir


    hi
  end
end
