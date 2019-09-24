class ball {
  float x, y, dx, dy, r;
  boolean dragged;
  color c;

  ball(float sx, float sy) {
    x = sx+random(-r, r);
    y = sy+random(-r, r);
    dx = random(-10, 10);
    dy = random(-10, 10);
    r = 25;
    colorMode(HSB);
    c = color(random(0, 255),255,255);
    dragged = false;
  }

  void update() {
    fill(c);
    ellipse(x, y, 2*r, 2*r);

    if (dragged) {
      x += mouseX - pmouseX;
      y += mouseY - pmouseY;
    } else {
      x += dx;
      y += dy;
      dx += gravity_x;
      dy += gravity_y;
    }
  }

  void snitch() {
    if (withinBall(mouseX, mouseY, x, y, r)) {
      dragged = true;
    }
  }

  void release() {
    if (dragged) {
      dragged = false;
      dx = mouseX - pmouseX;
      dy = mouseY - pmouseY;
    }
  }

  void checkBorderCollision() {
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
}

boolean withinBall(float x, float y, float a, float b, float r) {
  if (dist(x, y, a, b) <= r) {
    return true;
  } else {
    return false;
  }
}
