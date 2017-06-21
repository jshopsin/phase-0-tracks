// BUSINESS LOGIC - PSUEDOCODE

// create a function that reverses a string
// input: string
// steps:
  // create an empty string to hold reversed string
  // for each letter in the string starting at the last letter and counting down, push the character into the reversed string
  // print the reversed string
// output: reversed string

// BUSINESS LOGIC

function reverseString(str) {
  var str = str.split('');
  var newStr = [];
  for (var i = str.length; i >= 0; i--) {
    newStr.push(str[i])
  };
  newStr = newStr.join('');
  if (str.length <= 5) {
    console.log(newStr);
  } else {
    console.log("The string is too long to reverse.");
  }
};


// DRIVER CODE

reverseString("Hello")
reverseString("Jupiter Rising")

