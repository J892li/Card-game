
//Jiaxuan Li
//20722311

PFont fonta; //create font 
PFont fontb;
import processing.sound.*;  // import sound

PImage wis;  // import 4 images
PImage king;
PImage dev;
PImage doge;

import controlP5.*;  // import contrlP5
ControlP5 ui;
SoundFile sounda;  // call sound file
SoundFile soundb;

Knob WisSlider;  // call controlP5 interface
Knob otherSlider;

PImage[] results = new PImage[4]; //load 4 pics
PImage[] resultLine; // resultline is the first section of this game
// 3 wisdom card produce 100 points
// 3 king card produce 20 points
// 3 devil card produce 40 points
// 3 doge produce 60 points 
boolean startGame = true; //start game or not 

// the 4 possibility of game, 100, 20, 40, 60
int[] totalWin = {100, 20, 40, 60};

int delegates ; // use numbers to represents the pics

// Wins is how many points the player wins
int Wins;

//there is a equal chance of wining which is 100/4
float WisPercent = 0.25; // this is the chance of wisdom card
float otherPercent = 0.25;
float r; // r is the random number 


void setup() {
  size(660, 600);  // size
  frameRate(10);   
  resultLine = new PImage[3];
  textSize(18);
  sounda = new SoundFile(this, "sounda.wav");   // load sound file
  soundb = new SoundFile(this, "soundb.wav");
  fonta = loadFont("BodoniMTCondensed-Italic-48.vlw");  //load font
  fontb = loadFont("Calibri-BoldItalic-20.vlw");
  wis = loadImage("wis.png");
  king = loadImage("king.png");
  dev = loadImage("dev.png");
  doge = loadImage("doge.png");
   results[0] = wis;    // use 1234 to represent pics
   results[1] = king;
   results[2] = dev;
   results[3] = doge;

  ui = new ControlP5( this ); // create interface and assign details 

  WisSlider = ui.addKnob( "Wisdom BiaSlider" );
  WisSlider.setPosition( 60, 270 );
  WisSlider.setSize( 100, 10 );
  WisSlider.setRange( 0.1, 0.9 ); // minimum and maximum values
  WisSlider.setValue( 0.25 ); // initial value

  otherSlider = ui.addKnob( "Other BiaSlider" );
  otherSlider.setPosition( 460, 270);
  otherSlider.setSize( 100, 10 );
  otherSlider.setRange( 0.1, 0.9); // minimum and maximum values
  otherSlider.setValue( 0.25); // initial value
}


void draw() {
  if (startGame) {
    playGame();

    beginShape(POINTS);  // decoration for game area
    strokeWeight(10);
    stroke(#F7F7F7);
    vertex(30, 20);
    vertex(650, 20);
    vertex(650, 230);
    vertex(30, 230);
    endShape();

    beginShape(LINES);  // decoration for game area 
    strokeWeight(5);
    stroke(#F7F7F7);
    strokeCap(ROUND);
    vertex(50, 20);
    vertex(630, 20);
    vertex(50, 230);
    vertex(630, 230);
    endShape();

    strokeWeight(2);
    line(0, 400, width, 400);
    noStroke();
    
    // text display
  textFont(fonta, 50);
  fill(#FFFFFF);
  text("Simple Tarot Game ", 190, height * 0.78);
  textFont(fontb, 20);
  text("Wins:" + Wins, 190, height * 0.83);
  stroke(0);
  line(0, 250, width, 250);
  text("Need brain Percent is: " + WisPercent * 100, 190, height * 0.89);
  text("Others Percent is:  " + otherPercent * 100, 190, height * 0.95);
  fill(#EA9F3B);
  noStroke();
  ellipse(320, 325, 110, 110);
  fill(#FFFFFF);
  textFont(fonta, 70);
  text("$", 305, height * 0.58);
  }
}

void controlEvent( ControlEvent ev )  // deirect control of chances of wininng 
{
  if (ev.isFrom( WisSlider )) {
    WisPercent =  WisSlider.getValue();
  } else if (ev.isFrom( otherSlider)) {
    otherPercent  = otherSlider.getValue();
  }
}

void keyPressed() {
  // 'a' stands for going back to 25%.
  if (key == 'a') {
    WisPercent = 0.25;
    otherPercent = 0.25;
    // 'n' stands for 50% of chances of wining.
  } else if (key == 'v') {
    WisPercent = 0.50;
    otherPercent = 0.25;
  } else if (key == 'p') {
    startGame = true;
  }

  if ((key == 's') || (key == 'S' )) {
    save("screenshot.jpg");
  }
}
