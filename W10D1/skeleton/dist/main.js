/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! exports provided: clock */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"clock\", function() { return clock; });\nclass Clock {\n  constructor() {\n    const currentTime = new Date();\n\n    this.hours = currentTime.getHours();\n    this.minutes = currentTime.getMinutes();\n    this.seconds = currentTime.getSeconds();\n\n    this.printTime();\n\n    setInterval(this._tick.bind(this), 1000);\n  }\n\n  printTime() {\n    if(clockElement.firstChild) {\n      clockElement.removeChild(clockElement.firstChild);\n    }\n    const timeString = [this.hours, this.minutes, this.seconds].join(\" : \");\n    \n    let p = document.createElement(\"p\");\n    p.textContent = timeString;\n    clockElement.appendChild(p);\n  }\n\n  _tick() {\n    this._incrementSeconds();\n\n    this.printTime();\n  }\n\n  _incrementSeconds() {\n    this.seconds += 1;\n    if (this.seconds === 60) {\n      this.seconds = 0;\n      this._incrementMinutes();\n    }\n  }\n\n  _incrementMinutes() {\n    this.minutes += 1;\n    if (this.minutes === 60) {\n      this.minutes = 0;\n      this._incrementHours();\n    }\n  }\n\n  _incrementHours() {\n    this.hours = (this.hours + 1) % 24;\n  }\n}\nconst clockElement = document.getElementById(\"clock\");\n\nconst clock = new Clock();\n\n\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\ndogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nfunction dogLinkCreator(){\n  let arr = [];\n  Object.keys(dogs).forEach( key => {\n    let link = document.createElement(\"a\");\n    link.innerHTML = key;\n    link.href = dogs[key];\n    let list = document.createElement(\"li\");\n    list.className = 'dog-link';\n    list.appendChild(link)\n    arr.push(list);\n  });\n  return arr;\n}\n\nfunction attachDogLinks(){\n  let dogLinks = dogLinkCreator();\n  let ul = document.getElementsByClassName(\"drop-down-dog-list\")[0];\n  dogLinks.forEach( dog => {\n    ul.appendChild(dog);\n  });\n}\n\nfunction handleEnter() {\n  let dogs = document.getElementsByClassName('dog-link');\n  Array.from(dogs).forEach( dog => {\n    dog.style.visibility = 'visible';\n  })\n}\n\nfunction handleLeave() {\n  let dogs = document.getElementsByClassName('dog-link');\n  Array.from(dogs).forEach( dog => {\n    dog.style.visibility = 'hidden';\n  })\n}\n\nlet nav = document.getElementsByClassName(\"drop-down-dog-nav\")[0];\n\nnav.addEventListener('mouseenter', e => {\n  handleEnter();\n});\n\nnav.addEventListener('mouseleave', e => {\n  handleLeave();\n});\n\nattachDogLinks();\n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("let todos = [];\nlet ul = document.getElementsByClassName(\"todos\")[0];\nlet form = document.getElementsByClassName(\"add-todo-form\")[0];\n\n\nclass Todo {\n  constructor(value, done) {\n    this.value = value;\n    this.done = done;\n  }\n}\n\n\nfunction addTodo() {\n  if (localStorage.getItem('todos')) {\n    todos = JSON.parse(localStorage.getItem('todos'));\n  }\n  let input = document.querySelector ('[name=\"add-todo\"]');\n  let value = input.value;\n  if (value.length > 0) {\n    let newTodo = new Todo(value, false);\n    todos.push(newTodo);\n    input.value = \"\";\n  }\n  while (ul.firstChild){\n    ul.removeChild(ul.firstChild);\n  }\n  localStorage.setItem('todos', JSON.stringify(todos));\n  populateList();\n  \n}\n\nfunction populateList() {\n  todos.forEach( todo => {\n    let li = document.createElement(\"li\");\n    let label = document.createElement(\"label\");\n    label.innerHTML = todo.value;\n    let check = document.createElement(\"INPUT\");\n    check.setAttribute(\"type\", \"checkbox\");\n    li.appendChild(label);\n    li.appendChild(check);\n    ul.appendChild(li);\n  })\n}\n\nlet button = document.querySelector('[value=\"+ Add Todo\"]');\n\nbutton.addEventListener(\"click\", e => {\n  e.preventDefault();\n  addTodo();\n});\n\naddTodo();\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n  let p = document.createElement(\"p\");\n  p.textContent = string;\n  htmlElement.appendChild(p);\n};\n\nhtmlGenerator('Party Time, WOO!!!.', partyHeader);\n\n//\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });