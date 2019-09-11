require_relative "Pieces/pieces.rb"

class Board
  def initialize
    @sentinel = NullPiece.instance
    @board = Array.new(8) {Array.new(8, @sentinel)}

  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end

  def add_piece(piece, pos)
    self[pos] = piece
  end

  def move_piece(color, start_pos, end_pos)
    if valid_moves.include?(end_pos)
      temp = self[start_pos]
      self[start_pos] = @sentinel
      self[end_pos] = temp
    end
  end

  def valid_pos?(pos)
  end
  
  def checkmate?(color)
  end

  def in_check?(color)
  end

  def find_king(color)
  end

  def pieces
  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)
  end

end



