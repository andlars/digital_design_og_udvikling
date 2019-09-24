float x, y, dx, dy, r; //<>//
boolean dragged;

float elasticity;
float gravityX, gravityY;

void setup() {
  size(500, 500);
  x = 30;
  y = 100;
  dx = 1.8;
  dy = 0;
  r = 25;
  elasticity = 0.8;
  dragged = false;
  gravityX = 0.0;
  gravityY = 0.1;
}

void draw() {
  background(255);
  noStroke();

  fill(200, 0, 0);
  ellipse(x, y, 2*r, 2*r);

  if (dragged) {
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  } else {
    x += dx;
    y += dy;
    dx += gravityX;
    dy += gravityY;
  }

  if (x-r <= 0 ) {
    dx *= -elasticity;
    x = r;
  }
  if (x+r >= width) {
    dx *= -elasticity;
    x = width - r;
  }
  if (y-r <= 0) {
    dy *= -elasticity;
    y = r;
  }
  if (y+r >= height) {
    dy *= -elasticity;
    y = height - r;
  }
}

void mousePressed() {
  if (withinBall(mouseX, mouseY, x, y, r)) {
    dragged = true;
  }
}

void mouseReleased() {
  if (dragged) {
    dragged = false;
    dx = mouseX - pmouseX;
    dy = mouseY - pmouseY;
  }
}

boolean withinBall(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
    return false;
  }
}
