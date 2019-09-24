class bold {
  float x, y, r;  // (x, y) er centrum af bolden, r er radius.
  
  bold(float init_x, float init_y, float init_r) {
    x = init_x;
    y = init_y;
    if (init_r <= 0) {
      println("Fejl: radius af en bold, skal være positivt!");
      exit();  // stop programmet!
    } else {
      r = init_r;
    }
  }
  
  void tegn() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, 2*r, 2*r);
  }
}
