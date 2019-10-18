const DOMNodeCollection = require('./dom_node_collection.js');



window.$l = (selector) => {
  let elements = [];
  if( selector instanceof HTMLElement ) {
    elements.push(selector);
    return new DOMNodeCollection(elements); //[<p>]
  }
  
  let selected = document.querySelectorAll(selector);
  return new DOMNodeCollection(selected); // ["p"]
};
