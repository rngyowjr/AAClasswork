class Clock {
  constructor() {
    let d = new Date();
    this.hr = d.getHours();
    this.min = d.getMinutes();
    this.sec = d.getSeconds();

    this.printTime();

    // setInterval(function() {
    //   that._tick();
    // }, 1000);
    setInterval(this._tick.bind(this), 1000);
  }

  printTime() {
    console.log(`${this.hr}:${this.min}:${this.sec}`);
  }

  _tick() {
    if(this.sec === 59){
      if (this.min === 59){
        if (this.hr === 23){
          this.hr = 0;
          this.min = 0;
          this.sec = 0;
        } else {
          this.hr++;
          this.min = 0;
          this.sec = 0;
        }
      } else {
        this.min++;
        this.sec = 0;
      }
    } else {
      this.sec++;
    }

    this.printTime(this.hr, this.min, this.sec);
  }
}



