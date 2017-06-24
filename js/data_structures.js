// Release 0 - Arrays:

var horseColors = ["blue", "pink", "glitter", "rainbow"];
var horseNames = ["Journey", "Stormy", "Penelope", "Clifford"];

console.log(horseColors);
console.log(horseNames);

horseColors.push("striped");
horseNames.push("Spot");

console.log(horseColors);
console.log(horseNames);


// Release 1 - Build an Object:

var horsies = {};

console.log(horsies);

for (var i = 0; i < horseColors.length; i++) {
  horsies[horseNames[i]] = horseColors[i]
};

console.log(horsies);


// Release 2 - Build a Constructor Function:

function Car(color) {
  this.color = color;
  this.tireSpeed = Math.round(Math.random() * (60));
  this.changeTire = function() { console.log("Congratulations, the " + this.color + " car is ready. We changed your tire in  " + this.tireSpeed + " minutes."); };
};

var firstCar = new Car("blue");
// console.log(firstCar);
firstCar.changeTire();
var secondCar = new Car("red");
secondCar.changeTire();
var thirdCar = new Car("green");
thirdCar.changeTire();

// Release 3 - Research:

/**

How to loop through keys and values of an object literal:

  for (var i = 0; i < horseColors.length; i++) { horsies[horseNames[i]] = horseColors[i]};

  for (var key in horsies) { console.log(horsies[key]) };

  for (var value in horsies) { console.log(horsies[value]) };

  Object.keys(horsies).forEach(key => console.log(horsies[key]));

Advantages and disadvantages of constructor functions:

  Constructor functions give access to properties and methods within when creating children or instances of that object. These properties can then become very dangerous since they can always be redefined in each instance of the object. Constructor functions take advantage of prototype chaining to creating objects, which can be more complicted since the functions created in the prototype would need to be assigned to each instance. Factory functions can be used instead of constructor functions which lock these properties so that they cannot be reassigned.

*/

