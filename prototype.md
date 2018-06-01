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

### F.prototype
In JavaScript, we can set a prototype using ```__proto__```. JavaScript has had prototypal inheritance from the beginning, one of the core features of the language.
But in the old times, the only way to set prototype is to use a ```"prototype"``` property of the constructor function.

### The "prototype" property
```new F()``` creates a new object. The new object created with ```new F()```, its ```[[Prototype]]``` is set to ```F.prototype```.
