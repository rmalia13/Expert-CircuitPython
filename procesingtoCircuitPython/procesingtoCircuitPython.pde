float x;
float y;
float easing = 1;

void setup() {
  size(500, 650); 
  //noStroke();
}

void draw() { 
  background(0, 0, 0);
  //println(mouseX, mouseY);
  float cx = constrain(mouseX, 0, 500);
  float cy = constrain(mouseY, 0, 500);
  
  float mx = map(cx, 0, 500, 0, 180);
  float my = map(cy, 0, 500, 0, 180);

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

  float targetX = mouseX;
  float dx = targetX - x;
  x += dx * easing;

  float targetY = mouseY;
  float dy = targetY - y;
  y += dy * easing;

  ellipse(cx, cy, 10, 10);
}
