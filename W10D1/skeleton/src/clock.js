class Clock {
  constructor() {
    const currentTime = new Date();

    this.hours = currentTime.getHours();
    this.minutes = currentTime.getMinutes();
    this.seconds = currentTime.getSeconds();

    this.printTime();

    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    if(clockElement.firstChild) {
      clockElement.removeChild(clockElement.firstChild);
    }
    const timeString = [this.hours, this.minutes, this.seconds].join(" : ");
    
    let p = document.createElement("p");
    p.textContent = timeString;
    clockElement.appendChild(p);
  }

  _tick() {
    this._incrementSeconds();

    this.printTime();
  }

  _incrementSeconds() {
    this.seconds += 1;
    if (this.seconds === 60) {
      this.seconds = 0;
      this._incrementMinutes();
    }
  }

  _incrementMinutes() {
    this.minutes += 1;
    if (this.minutes === 60) {
      this.minutes = 0;
      this._incrementHours();
    }
  }

  _incrementHours() {
    this.hours = (this.hours + 1) % 24;
  }
}
const clockElement = document.getElementById("clock");

export const clock = new Clock();

