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
    temp = self[start_pos]

    if temp.valid_moves.include?(end_pos)
      self[start_pos] = @sentinel
      self[end_pos] = temp
    end
  end

  # def valid_moves(piece)
  #   possible_moves = []
  #   x, y = piece.pos
  #   moves.each do |(dx, dy)|
  #     new_pos = [x + dx, y + dy]
  #     if new_pos.between?(0, 7) || @board[new_pos] == @sentinel
  #       possible_moves << new_pos
  #     end
  #   end

  #   possible_moves
  # end
  
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

# b = Board.new
# k = King.new("white", b, [0,1])

# load 'Board.rb'
b = Board.new
rook = Rook.new("white", b, [0,4])
b.add_piece(rook, [0,4])
b.move_piece("white", [0,4], [0,3])


