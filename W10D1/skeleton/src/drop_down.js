
dogs = {
  "Corgi": "https://www.akc.org/dog-breeds/cardigan-welsh-corgi/",
  "Australian Shepherd": "https://www.akc.org/dog-breeds/australian-shepherd/",
  "Affenpinscher": "https://www.akc.org/dog-breeds/affenpinscher/",
  "American Staffordshire Terrier": "https://www.akc.org/dog-breeds/american-staffordshire-terrier/",
  "Tosa": "https://www.akc.org/dog-breeds/tosa/",
  "Labrador Retriever": "https://www.akc.org/dog-breeds/labrador-retriever/",
  "French Bulldog": "https://www.akc.org/dog-breeds/french-bulldog/" 
};

function dogLinkCreator(){
  let arr = [];
  Object.keys(dogs).forEach( key => {
    let link = document.createElement("a");
    link.innerHTML = key;
    link.href = dogs[key];
    let list = document.createElement("li");
    list.className = 'dog-link';
    list.appendChild(link)
    arr.push(list);
  });
  return arr;
}

function attachDogLinks(){
  let dogLinks = dogLinkCreator();
  let ul = document.getElementsByClassName("drop-down-dog-list")[0];
  dogLinks.forEach( dog => {
    ul.appendChild(dog);
  });
}

function handleEnter() {
  let dogs = document.getElementsByClassName('dog-link');
  Array.from(dogs).forEach( dog => {
    dog.style.visibility = 'visible';
  })
}

function handleLeave() {
  let dogs = document.getElementsByClassName('dog-link');
  Array.from(dogs).forEach( dog => {
    dog.style.visibility = 'hidden';
  })
}

let nav = document.getElementsByClassName("drop-down-dog-nav")[0];

nav.addEventListener('mouseenter', e => {
  handleEnter();
});

nav.addEventListener('mouseleave', e => {
  handleLeave();
});

attachDogLinks();