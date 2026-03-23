// ⭐⭐ Web Dev Assignment - Completed ⭐⭐

// Arrays for stars
var starXPos = [];
var starYPos = [];
var starSizes = []; // new for star sizes
var star = "⭐️";
var starTotal = 100;

// Arrays for planets
var planetXPos = [];
var planetYPos = [];
var planetEmoji = []; //  for random planet emojis
var planetTypes = ["🪐", "🌕", "☄️", "🛸", "⭐️", "🌍"];
var planetTotal = 6;
var planetFound = 0;


setup = function() {
  size(600, 450);
  reset();
};


draw = function(){ 
  
  if(keyPressed){ 
    if(key == 'r'){ reset(); } 
      if(key == 't'){ for(var i = 0; i < 5; i++){
    starXPos.push(random(0,600));
    starYPos.push(random(0,400));
    starSizes.push(random(12,30)); // random size
  }
 } 
    } 
    
    
    display(); 
    
    
    }



 
 
 // Click planets
mouseClicked = function(){
  check(mouseX, mouseY);
};

mousePressed = function() {
  starXPos.push(mouseX);
  starYPos.push(mouseY);
  starSizes.push(random(12, 30));
};


  var check = function(xClick, yClick){
  for(var i = planetXPos.length - 1; i >= 0; i--){
    if(dist(xClick, yClick, planetXPos[i], planetYPos[i]) < 15){
      planetXPos.splice(i, 1);
      planetYPos.splice(i, 1);
      planetEmoji.splice(i, 1); // remove corresponding emoji
      planetFound++;
    }
  }
};


var display = function(){
  background(100,100,100);

  fill(200,200,0);
  textSize(20);

  
  for(var i = 0; i < planetXPos.length; i++){
    text(planetEmoji[i], planetXPos[i], planetYPos[i]);
  }

  // Draw stars with random sizes
  for(var i = 0; i < starXPos.length; i++){
    textSize(starSizes[i]); 
    text(star, starXPos[i], starYPos[i]);
  }

  
  fill(0,0,0);
  rect(0,400,600,50);
  fill(255,255,255);
  text("Find The Planets   |   " + planetFound + "/" + planetTotal, 0, 425);

  
  var count = 0;
  while(count < planetXPos.length){
    fill(255);
    text("🌟", 10 + count*20, 440);
    count++;
  }

  
  if(planetFound == planetTotal){
    fill(0, 200, 200);
    textSize(50);
    text("Press 'r' to restart the game", 50, 200);
  }
};


var reset = function(){
  starXPos = [];
  starYPos = [];
  starSizes = []; // clear sizes
  planetXPos = [];
  planetYPos = [];
  planetEmoji = []; 
  planetFound = 0;

  
  for(var i = 0; i < starTotal; i++){
    starXPos.push(random(0,600));
    starYPos.push(random(0,400));
    starSizes.push(random(12,30)); // random size
  }

  
  for(var i = 0; i < planetTotal; i++){
    planetXPos.push(random(0,600));
    planetYPos.push(random(0,400));
    var index = Math.floor(Math.random() * planetTypes.length);
    planetEmoji.push(planetTypes[index]);
  }
};
  
