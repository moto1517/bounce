void setup() {
  size(800, 800);
  noStroke();
  colorMode(HSB);
  setup_spark();
  setup_ball();
}

void draw() {

  background(table);
  spark();
  ball();
  text(vig/vig_base,100,100);
}

//ええいああもらいなき
//ダッシュだぜ
//あああああ
