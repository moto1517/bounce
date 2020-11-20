void quake1() {
  popMatrix();
  pushMatrix();
  fill(0);
  if (millis()-stop_time<300&&stop_time!=0) {
    translate(random(-5, 5), random(-5, 5));
    rect(-10, height, width+10, height+10);
  }
}

void quake2() {
  popMatrix();
  pushMatrix();
  if (millis()-stop_time<300&&stop_time!=0) {
    translate(0, random(-5, 5));
    rect(0, height, width, height+10);
  }
}
