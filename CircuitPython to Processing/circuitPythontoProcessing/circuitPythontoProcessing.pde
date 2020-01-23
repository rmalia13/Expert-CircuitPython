// CircuitPython to Processing
// River Malia and Meg Gist

import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);
int cx, cy;
float potRadius;
float diameter;

void setup() {
  size(500, 500);
  stroke(255);
  int radius = min(width, height) / 2;
  potRadius = radius * 0.8;
  diameter = radius * 1.8;

  cx = width / 2;
  cy = height / 2;
}
void draw() {
  if (myPort.available() > 0) 
  { 
    int myNum = myPort.read();
    println(myNum);
   
    // Draw window background
    background(118, 71, 249);
    
    // Draw the clock background
    fill(80);
    noStroke();
    ellipse(cx, cy, diameter, diameter);

    // Angles for sin() and cos() start at 3 o'clock;
    // subtract HALF_PI to make them start at the top
    float p = map(myNum, 0, 255, TWO_PI, 0) - HALF_PI;
    
    // Draw the hands of the clock
    stroke(255);
    strokeWeight(2);
    line(cx, cy, cx + cos(p) * potRadius, cy + sin(p) * potRadius);
    
    // Draw the minute ticks
    strokeWeight(5);
    beginShape(POINTS);
    for (int a = 0; a < 360; a+=6) {
      float angle = radians(a);
      float x = cx + cos(angle) * potRadius;
      float y = cy + sin(angle) * potRadius;
      vertex(x, y);
    }
    endShape();
  }
}
