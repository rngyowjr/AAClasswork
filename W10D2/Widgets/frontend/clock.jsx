import React from 'react';

class Clock extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      newClock: new Date()
    };
  }

  render(){
    return (
      <div id="clock">
        <p>
          <span>Time: </span>
          <span>
            {this.state.newClock.getHours()}:
            {this.state.newClock.getMinutes()}:
            {this.state.newClock.getSeconds()} PDT
          </span>
        </p>

        <p>
          <span>Date: </span>
          <span>
            {this.state.newClock.toDateString()}
          </span>
        </p>
      </div>
    );
  }

  tick() {
    this.setState({newClock: new Date()});
  }
  
  componentDidMount(){
    this.intervalID = setInterval(this.tick.bind(this), 1000);
  }

  componentWillUnmount(){
    clearInterval(this.intervalID)
  }

}

export default Clock;