class DOMNodeCollection {
  constructor(arr) {
    this.arr = arr;
  }

  html(str) {
    if(!str) {
      return this.arr[0].innerHTML;
    }
    this.arr.forEach( (element) => {
      element.innerHTML = str;
    });
  }

  empty() {
    this.arr.forEach( (element) => {
      element.innerHTML = "";
    });
  }

  append(str) {
    this.arr.forEach( (element) => {
      element.innerHTML += str;
    });
  }


}

module.exports = DOMNodeCollection;