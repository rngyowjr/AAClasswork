let Piece = require("./piece");

/**
 * Returns a 2D array (8 by 8) with two black pieces at [3, 4] and [4, 3]
 * and two white pieces at [3, 3] and [4, 4]
 */
function _makeGrid () {
  //Array.from(Array(8), () => new Array (8))

  const board = new Array(8).fill();
  for (let i = 0; i < board.length; i++) {
    board[i] = new Array(8).fill();
  }

  board[3][4] = new Piece("black");
  board[4][3] = new Piece("black");
  board[3][3] = new Piece("white");
  board[4][4] = new Piece("white");

  return board;
}


/**
 * Constructs a Board with a starting grid set up.
 */
function Board () {
  this.grid = _makeGrid();
}

Board.DIRS = [
  [ 0,  1], [ 1,  1], [ 1,  0],
  [ 1, -1], [ 0, -1], [-1, -1],
  [-1,  0], [-1,  1]
];

/**
 * Returns the piece at a given [x, y] position,
 * throwing an Error if the position is invalid.
 */
Board.prototype.getPiece = function (pos) {
  if(this.isValidPos){
    return this.grid[pos[0]][pos[1]];
  }
  return new Error("outta bounds");
};

/**
 * Checks if there are any valid moves for the given color.
 */
Board.prototype.hasMove = function (color) {
  return this.validMoves(color).length !== 0;
};

/**
 * Checks if the piece at a given position
 * matches a given color.
 */
Board.prototype.isMine = function (pos, color) {

  let piece = this.grid[pos[0]][pos[1]]; 
  if (this.grid[pos[0]][pos[1]] === undefined) {
    return false;
  }
  return piece.color === color;
};

/**
 * Checks if a given position has a piece on it.
 */
Board.prototype.isOccupied = function (pos) {
  return this.grid[pos[0]][pos[1]] !== undefined; 
};

/**
 * Checks if both the white player and
 * the black player are out of moves.
 */
Board.prototype.isOver = function () {
  return !this.hasMove("white") && !this.hasMove("black");
};

/**
 * Checks if a given position is on the Board.
 */
Board.prototype.isValidPos = function (pos) {
  return (pos[0] >= 0 && pos[0] < 8) && (pos[1] >= 0 && pos[1] < 8); 
};

/**
 * Recursively follows a direction away from a starting position, adding each
 * piece of the opposite color until hitting another piece of the current color.
 * It then returns an array of all pieces between the starting position and
 * ending position.
 *
 * Returns null if it reaches the end of the board before finding another piece
 * of the same color.
 *
 * Returns null if it hits an empty position.
 *
 * Returns null if no pieces of the opposite color are found.
 */
function _positionsToFlip (board, pos, color, dir, piecesToFlip) {

  let newPos = [pos[0] + dir[0], pos[1] + dir[1]];

  if(!board.isValidPos(newPos)) {
    return null;
  }

  if(!board.isOccupied(newPos)) {
    return null;
  }

  if(board.isMine(newPos, color)) {
    if(piecesToFlip.length === 0){
      return null;
    }
    return piecesToFlip;
  }

  piecesToFlip.push(newPos);

  return _positionsToFlip(board, newPos, color, dir, piecesToFlip);

}

/**
 * Adds a new piece of the given color to the given position, flipping the
 * color of any pieces that are eligible for flipping.
 *
 * Throws an error if the position represents an invalid move.
 */
Board.prototype.placePiece = function (pos, color) {
  if(!this.validMove(pos, color)){
    throw new Error("no bueno");
  }

  this.grid[pos[0]][pos[1]] = new Piece(color);

  for (let i = 0; i < Board.DIRS.length; i++) {
    flipArr = _positionsToFlip(this, pos, color, Board.DIRS[i], []);
    // console.log(flipArr);
    if(flipArr){
      flipArr.forEach(pos => {
        this.getPiece(pos).color = color;
      });
    }

    // flipArr.forEach(function(flipPos) {
    //   this.getPiece(flipPos).color = color;
    // });
  }

};

/**
 * Prints a string representation of the Board to the console.
 */
Board.prototype.print = function () {
  // console.clear();
  console.log(" 01234567");
  for (let i = 0; i < 8; i++) {
    let row = i;

    for (let i2 = 0; i2 < 8; i2++) {
      let pos = [i, i2];
      row +=
        (this.getPiece(pos) ? this.getPiece(pos).toString() : "~");
    }
    console.log(row);
  }
};

/**
 * Checks that a position is not already occupied and that the color
 * taking the position will result in some pieces of the opposite
 * color being flipped.
 */
Board.prototype.validMove = function (pos, color) {
  if(this.isOccupied(pos)) {
    return false;
  }
  for (let i = 0; i < Board.DIRS.length; i++) {
    flipArr = _positionsToFlip(this, pos, color, Board.DIRS[i], []);
    if(flipArr){
      return true;
    }
  }


  return false;
};

/**
 * Produces an array of all valid positions on
 * the Board for a given color.
 */
Board.prototype.validMoves = function (color) {
  const validMoves = [];
  
  for (let i = 0; i < 8; i++) {
    for (let i2 = 0; i2 < 8; i2++) {
      if(this.validMove([i,i2], color)) {
        validMoves.push([i, i2]);
      }
    }
  }
  return validMoves;
};

module.exports = Board;
