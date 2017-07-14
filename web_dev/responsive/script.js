console.log("what up world");

var header = document.getElementById("header");
header.style.position = "fixed";

function mOver(event) {
  event.target.innerHTML = "Mean Cats";
};

function mOut(event) {
  event.target.innerHTML = "Mean Cats rule the world and take over the header!";
  event.target.style.backgroundColor = "purple";
  event.target.style.color = "lavender";
};

header.addEventListener("mouseover", mOver);
header.addEventListener("mouseout", mOut);

