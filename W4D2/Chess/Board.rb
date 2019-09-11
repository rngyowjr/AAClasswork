class Board
  def initialize
    @board = Array.new(8) {Array.new(8, "_")}
  end

  def move_piece(start_pos, end_pos)
    @board[start_pos] = @piece
  end

  def [](pos)
    row, col = pos
    @board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @board[row][col] = val
  end
end

class Piece < Board
  def initialize(start_pos)
    @start_pos = start_pos

    self[@start_pos] = "Q"
  end
end