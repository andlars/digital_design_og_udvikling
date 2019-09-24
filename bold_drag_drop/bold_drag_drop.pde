float x, y; //<>//
float dx, dy, ddx, ddy;
float r, elasticitet;
boolean boldHold;

void setup() {
  size(500, 500);
  x = 30;
  y = 100;
  dx = 1.8;
  dy = 0;
  r = 25;
  elasticitet = 0.8;
  boldHold = false;

  // boldens acceleration i de to retninger
  ddx = 0.0;
  ddy = 0.1;
}

void draw() {
  background(255);
  noStroke();

  fill(200, 0, 0);
  ellipse(x, y, 2*r, 2*r);

  if (boldHold) {
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  } else {
    x += dx;
    y += dy;
    dx += ddx;
    dy += ddy;
  }

  if (x-r <= 0 ) {
    dx *= -elasticitet;
    x = r;
  } else if (x+r >= width) {
    dx *= -elasticitet;
    x = width - r;
  } else if (y-r <= 0) {
    dy *= -elasticitet;
    y = r;
  } else if (y+r >= height) {
    dy *= -elasticitet;
    y = height - r;
  }
}

void mousePressed() {
  if (indenForBold(mouseX, mouseY, x, y, r)) {
    boldHold = true;
  }
}

void mouseReleased() {
  if (boldHold) {
    boldHold = false;
    dx = mouseX - pmouseX;
    dy = mouseY - pmouseY;
  }
}

boolean indenForBold(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
    return false;
  }
}
