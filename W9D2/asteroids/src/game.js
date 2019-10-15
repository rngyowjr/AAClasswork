function Game(DIM_X, DIM_Y, NUM_ASTEROIDS) {
  this.x = DIM_X;
  this.y = DIM_Y;
  this.numAsteroids = NUM_ASTEROIDS;

}

Game.prototype.addAsteroids = function(){
  let asteroids = []
  // let position = Game.randomPosition();

  for (let i = 0; asteroids.length < NUM_ASTEROIDS; i++) {
    let newAsteroid = new Asteroid({pos: Game.randomPosition()});
    asteroids.push(newAsteroid);
  }
  return asteroids;

}

Game.prototype.randomPosition = function(){
  let pos1 = Math.floor(Math.random() * Math.floor(1000));
  let pos2 = Math.floor(Math.random() * Math.floor(600));
  return [pos1, pos2];
}

Game.prototype.move = function() {

}

Game.prototype.checkCollisions = function() {

}

Game.prototype.draw = function (ctx) {

  ctx.clearRect(0, 0, 1000, 600);
  ctx.fillStyle = "black";
  ctx.fillRect(0, 0, 1000, 600);

}


console.log(Game.randomPosition());
console.log(Game.randomPosition());