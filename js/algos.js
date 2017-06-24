// PSUEDOCODE

// RELEASE 0 -  Find the Longest Phrase
// create a function that takes an array and returns longest string
// input: array
// steps:
  // create an empty string (longestString)
  // FOR each item in the array, change the value of longestString to equal the string in the array IF it's length is larger than the current longestString
// output: longest string

// RELEASE 1 - Find a Key-Value Match
// create a function that takes two objects and see if they share a key-value pair
// input: objectA, objectB
// steps:
  // FOR each key in ObjectA:
    // compare key to EACH key in Object B
    // IF the key is the same, IF the value is also the same then return true
    // ELSE return false
// output: boolean


// RELEASE 0 - BUSINESS LOGIC
words1 = ["hello", "starting", "long", "short", "ending"]
words2 = ["long", "longer", "longest"]

var longestWord = function(array) {
  longestString = "";
  for (i in array) {
    if (array[i].length > longestString.length)
      longestString = array[i]
  };
  console.log(longestString);
};

// RELEASE 1 - BUSINESS LOGIC
horse1 = {name: "Windy", age: 2, color: "white"};
horse2 = {name: "Winston", age: 6, color: "brown"};
bird1 = {name: "Windy", age: 6, eyeColor: "blue"};
bird2 = {name: "Harley", age: 10, eyeColor: "blue"};

var includePair = function(objA, objB) {
  include = false;
  aKeys = [];
  bKeys = [];
  for (var key in objA) { aKeys.push(objA[key]) };
  for (var key in objB) { bKeys.push(objB[key]) };
  for (i in aKeys) {
    while (include !== true) {
      if (aKeys[i] === bKeys[i]) {
        if (objA[i] === objB[i]) {
          console.log("The objects share a key-value pair!");
          include = true;
        } else { include = false };
      };
      if(include === false) {
        break;
      };
    };
  };
  if (include === false) { console.log("The objects do not share a key-value pair.") };
};

// RELEASE 0 - DRIVER CODE
longestWord(words1);
longestWord(words2);

// RELEASE 1 - DRIVER CODE

includePair(horse1, bird1); // true
includePair(horse1, bird2); // false
includePair(horse2, bird1); // true
includePair(horse2, bird2); // false
includePair(horse1, horse2); // false
includePair(bird1, bird2); // true
