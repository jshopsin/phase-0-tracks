var horseColors = ["blue", "pink", "glitter", "rainbow"];
var horseNames = ["Journey", "Stormy", "Penelope", "Clifford"];

console.log(horseColors);
console.log(horseNames);

horseColors.push("striped");
horseNames.push("Spot");

console.log(horseColors);
console.log(horseNames);

var horsies = {};

console.log(horsies);

for (var i = 0; i < horseColors.length; i++) {
  horsies[horseNames[i]] = horseColors[i]
};

console.log(horsies);

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