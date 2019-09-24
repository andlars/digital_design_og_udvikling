float gravity_x, gravity_y, elasticity; //<>//
ArrayList<ball> Balls = new ArrayList<ball>();

void setup() {
  size(1000, 800);
  gravity_x = 0.0;
  gravity_y = 0.1;
  elasticity = 0.8;
}

void draw() {
  background(255);
  noStroke();
  fill(200, 0, 0);
  for (ball b : Balls) {
    b.update();
    b.checkBorderCollision();
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    Balls.add(new ball(mouseX, mouseY));
  } else if (mouseButton == LEFT) {
    if (key == 's') {
      for (ball b : Balls) {
        if (withinBall(mouseX, mouseY, b.x, b.y, b.r)) {
          b.snitch();
        }
      }
    }
    if (key == 'd') {
      ArrayList<ball> toRemove = new ArrayList<ball>();
      for (ball b : Balls) {
        if (withinBall(mouseX, mouseY, b.x, b.y, b.r)) {
          toRemove.add(b);
        }
      }
      Balls.removeAll(toRemove);
    }
  }
}

void mouseReleased() {
  for (ball b : Balls) {
    b.release();
  }
}
