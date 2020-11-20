void setup() {
  fullScreen();
  noStroke();
  rectMode(CORNERS);
  colorMode(HSB, 360, 100, 100);
  pushMatrix();
  setup_spark4();
  setup_ball3();
}

void draw() {
  background(table);
  quake1();
  oto();
  spark4();
  heat();
  ball3();
  text(vig / vig_base, 100, 100);
}
