import processing.serial.*;
Serial serialBruh;
int x = 0;
int y = 0;

void setup() {
  frameRate(40);
  size(500, 650);
  serialBruh = new Serial(this, Serial.list()[2], 9600);
  print(Serial.list());
}

void draw() { 
  background(0, 5, 0);
  //println(mouseX, mouseY);
  float cx = constrain(mouseX, 0, 500);
  float cy = constrain(mouseY, 0, 500);

  float mx = map(cx, 0, 500, 0, 180);
  float my = map(cy, 0, 500, 0, 180);

  int xdata = (int) mx;
  int ydata = (int) my;
  String xstring = nf(xdata,3);
  String ystring = nf(ydata,3);
  String data = xstring+","+ystring+" ";
  //print("huh?");
  stroke(255);
  strokeWeight(5);
  line(250, 500, 250, 0);
  line(0, 250, 500, 250);

  stroke(255);
  strokeWeight(5);
  line(0, 500, 500, 500);

  textSize(25);
  text("Servo 1:", 100, 550);
  text("Servo 2:", 100, 600);
  text(mx, 200, 550);
  text(my, 200, 600);

  ellipse(cx, cy, 10, 10);
  println(data);
  // TO DO: FIX THIS PART
  serialBruh.write(data);
}
