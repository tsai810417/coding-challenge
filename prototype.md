AJAX - Asynchronous JavaScript And XML: Allow websites to send/receive data to/from server in the background

Node: allow developers to write JS on the backend(server side JS)

MDN: The source of truth of JS
Object -> Hash in Ruby

Every function in JS will have a prototype property define on it

To add a “instance method” to a JS object:
```JavaScript
function NBAPlayer(name, team) {
this.name = name;
this.team = team;
}
```  
=> constructor function; define a Object

```JavaScript
const curry = new NBAPlayer(“Curry”, “SF”);
```
=> create an instance
```JavaScript
NBAPlayer.prototype.dunk = function() { };
```
=> create new function for this object
```JavaScript
curry.dunk();
```
=> method style invocation(“this” is properly assigned)

An ```instance.__proto__``` is the same as the NBAPlayer.prototype
DO NOT define instance method in the constructor function to keep the code DRY
```__proto__``` is defined on instance
prototype is defined on Object itself

```JavaScript
function soundMaker(sound, times) {

  function makeSound() {
    console.log(`${sound}`);
  }

  for(let i = 0; i < times; i++) {
    makeSound();
  }
}
```

### Closures
Closure use the variable defined outside of the scope of the function( use variable declared in the parent function)

When define a function, there are three levels of scope that the function will have access to:
- Arguments passed into the function
- Variables defined in the function
- Variables are already declared when the function is defined

### Event Loop
Event loop has one simple job. The event loop's job is to look at the stack and look at the task queue. If the stack is empty it takes the first thing(callback) on the queue and pushes it on to the stack, then the stack will run it.

The ```setTimeout``` with 0ms is going to run after all the stack is done executing

All the web APIs and AJAX request work the same way as ```setTimeout```. So that is the __Async call__.

The ```setTimeout``` is not the guaranteed time to execution, but the minimum time to execution because the callbacks will get queued to passed to call stack.

### F.prototype
In JavaScript, we can set a prototype using ```__proto__```. JavaScript has had prototypal inheritance from the beginning, one of the core features of the language.
But in the old times, the only way to set prototype is to use a ```"prototype"``` property of the constructor function.

### The "prototype" property
```new F()``` creates a new object. The new object created with ```new F()```, its ```[[Prototype]]``` is set to ```F.prototype```.
