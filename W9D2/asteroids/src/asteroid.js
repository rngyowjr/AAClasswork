const MovingObject =  require("./moving_object.js");
const Util =  require("./utils.js");

function Asteroid(obj){
  MovingObject.call(this, obj.pos);
  this.color = Asteroid.COLOR;
  this.radius = Asteroid.RADIUS;
  this.vel = Util.randomVec(4);
}

Asteroid.COLOR = 'gray';
Asteroid.RADIUS = 5;

Util.inherits(Asteroid, MovingObject);
module.exports = Asteroid;

// export your asteroid
// inherit because it's a class from your movingObject

