// Release 0 - Find the Longest Phrase

// Psuedocode
// create a function that takes an array and returns longest string
// input: array
// steps:
  // create an empty string (longestString)
  // FOR each item in the array, change the value of longestString to equal the string in the array IF it's length is larger than the current longestString
// output: longest string

words = ["hello", "start", "long", "short", "end", "longest"]

var longestWord = function(array) {
  longestString = "";
  for (i in array) {
    if (array[i].length > longestString.length)
      longestString = array[i]
  };
  console.log(longestString);
};

longestWord(words)