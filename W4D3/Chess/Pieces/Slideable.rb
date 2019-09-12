module Slideable

  def horizontal_dirs
    hori_dir = [
                    [0, 1],
                    [1, 0],
                    [-1, 0],
                    [0, -1]
                    ]
                    
    hori_dir
  end

  def diagonal_dirs
  diag_dir = [
                  [1, 1],
                  [1, -1],
                  [-1, 1],
                  [-1, -1]
                  ]

    diag_dir
  end

  def moves
    hori_dir = [
                    [0, 1],
                    [1, 0],
                    [-1, 0],
                    [0, -1]
                    ]

    arr = []

    hori_dir.each do |x, y|
      arr << grow_unblocked_in_dir(x, y)
    end

    arr
  end

  private
  
  def move_dirs

  end

  def grow_unblocked_in_dir(dx, dy) 
    possible_moves = []
    basex = dx
    basey = dy

    pos = dx, dy # [dx, dy]
    while valid_pos?(pos)
      dx += 1
      possible_moves << [dx, dy]
    end

    dx = basex
    dy = basey

    while valid_pos?(pos)
      dy += 1
      possible_moves << [dx, dy]
    end

    dx = basex
    dy = basey

    while valid_pos?(pos)
      dx -= 1
      possible_moves << [dx, dy]
    end

    dx = basex
    dy = basey

    while valid_pos?(pos)
      dy -= 1
      possible_moves << [dx, dy]
    end
  end

  def valid_pos?(pos)
    x, y = pos
    move_diffs.each do |(dx, dy)|
      new_pos = [x + dx, y + dy]
      if new_pos.all? { |coord| coord.between?(0, 7) } || @board[new_pos] == @sentinel
      # if new_pos.between?(0, 7) || @board[new_pos] == @sentinel
        return true
      end
    end

    return false
  end
end

# while valid pos keep stretching