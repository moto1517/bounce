void setup() {
  size(800, 800);
  noStroke();
  colorMode(HSB, 360,100,100);
  setup_spark();
  setup_ball3();
}

void draw() {
  //colorMode(HSB, 360,100,100);
  background(table);
  spark();
  heat();
  ball3();
  text(vig / vig_base, 100, 100);
}
