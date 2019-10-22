let todos = [];
let ul = document.getElementsByClassName("todos")[0];
let form = document.getElementsByClassName("add-todo-form")[0];


class Todo {
  constructor(value, done) {
    this.value = value;
    this.done = done;
  }
}


function addTodo() {
  if (localStorage.getItem('todos')) {
    todos = JSON.parse(localStorage.getItem('todos'));
  }
  let input = document.querySelector ('[name="add-todo"]');
  let value = input.value;
  if (value.length > 0) {
    let newTodo = new Todo(value, false);
    todos.push(newTodo);
    input.value = "";
  }
  while (ul.firstChild){
    ul.removeChild(ul.firstChild);
  }
  localStorage.setItem('todos', JSON.stringify(todos));
  populateList();
  
}

function populateList() {
  todos.forEach( todo => {
    let li = document.createElement("li");
    let label = document.createElement("label");
    label.innerHTML = todo.value;
    let check = document.createElement("INPUT");
    check.setAttribute("type", "checkbox");
    li.appendChild(label);
    li.appendChild(check);
    ul.appendChild(li);
  })
}

let button = document.querySelector('[value="+ Add Todo"]');

button.addEventListener("click", e => {
  e.preventDefault();
  addTodo();
});

addTodo();