// import MovingObject from "./moving_objects";

// webpack index.js - o bundle.js--watch--mode = development;

const Asteroid = require("./asteroid.js");

// window.Asteroid = Asteroid;

const MovingObject = require("./moving_object.js");

window.MovingObject = MovingObject;

console.log("Webpack is working");

window.addEventListener('DOMContentLoaded', (event) => {
  let canvas = document.getElementById("game-canvas");
  window.context = canvas.getContext("2d")
  window.context.fillStyle = "black";
  window.context.fillRect(0,0,1000, 600);

  const banana = new MovingObject({
    pos: [30, 30],
    vel: [10, 10],
    radius: 5,
    color: "yellow"
  });

  banana.draw(window.context);

  // const rock1 = new Asteroid({pos: [500, 300]});

  // rock1.draw(window.context);
});