import processing.serial.*;
import processing.sound.*;

SoundFile bleat;
SoundFile file;
Serial myPort;

PImage outside, inside;
PImage maskedImage;
PGraphics graphicalMask;
int iw, ih;
int dw, dh;
int x, y;
int myval;

PFont title;

void setup()
{
  String portName = Serial.list()[1];
  myPort = new Serial(this, portName, 9600);

  size(1500, 1000);
  outside = loadImage("surface.jpg");
  inside = loadImage("lamb.jpg");

  iw = outside.width;
  ih = outside.height;
  dw = width - iw;
  dh = height - ih;
  graphicalMask = createGraphics(iw, ih, JAVA2D);

  bleat = new SoundFile(this, "bleat.mp3");
  
  title = createFont("Impact", 50);
  
  file = new SoundFile(this, "marry_had_a_little_lamb.mp3");
  file.loop();
  
}

void draw()
{
  background(0);
  image(inside, 0, 0);
  graphicalMask.beginDraw();
  // Erase graphics with black background
  graphicalMask.background(0);
  
  textFont(title, 100); // Step 4: Specify font to be used
  fill(17, 50, 10);

  text("A Guide of Me!", 100, 123);
  
  while ( myPort.available() > 0) {
    myval = myPort.read();
    println(myval);
        
    if (myval ==1) {  //soup made from sheep's head
      
      x = 280;
      y = 480;
     
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else if (myval == 2) { // Chinese traditional medicine made from goat whiskers
      
      x = 292;
      y = 643;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
     
    } else if (myval == 3) { // Roasted lamb leg
      x = 1151;
      y = 643;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else if (myval == 4) { // Clothing made of wool
      x = 741;
      y = 378;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
      
    } else if (myval == 5) { // Braised Lamb Spine
      x = 985;
      y = 198;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else if (myval == 6) { // Soup made of sheep's innards
      x = 963;
      y = 333;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else if (myval == 7) { // Fat from the tail of sheep
      x = 1218;
      y = 355;
     
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else if (myval == 8) { // Goat milk
      x = 898;
      y = 529;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else if (myval == 9) { // Sheep's Blood Cake
      x = 489;
      y = 437;
      
      if(bleat.isPlaying() == false){
        bleat.play();
      }
    } else {   
      x = 0;
      y = 0;
    }
  } 
 
  
  // Draw in white
  graphicalMask.fill(255);
  graphicalMask.noStroke();
  // An ellipse to see a good part of the image
  graphicalMask.ellipse(x, y, 180, 180);
  graphicalMask.endDraw();

  // Black circle
  fill(87, 162, 36);
  ellipse(x, y, 200, 200);

  // Copy the original image (kept as reference)
  maskedImage = outside.get();
  // Apply the mask
  maskedImage.mask(graphicalMask);
  // Display the result
  image(maskedImage, dw/2, dh/2);
}
