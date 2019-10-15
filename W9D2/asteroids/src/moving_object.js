// import { __esModule } from "../dist/main";

function MovingObject(obj) {
  this.pos = obj.pos;
  this.vel = obj.vel;
  this.radius = obj.radius;
  this.color = obj.color;
}

MovingObject.prototype.move = function() {
  return [this.pos[0] + this.vel[0], this.pos[1] + this.vel[1]];
}

MovingObject.prototype.draw = function(ctx) {

  ctx.fillStyle = this.color;
  ctx.beginPath();

  ctx.arc(
    this.pos[0],
    this.pos[1],
    this.radius,
    0,
    2 * Math.PI,
    false
  );

  ctx.fill()
}

// Function.prototype.myBind(ctx)()

// MovingObject.prototype.isCollidedWith(otherMovingObject) = function() {

// }




module.exports = MovingObject;