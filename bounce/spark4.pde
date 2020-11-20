int MAX_PARTICLES;
color[] c;
ArrayList<Particle> p = new ArrayList<Particle>();

void setup_spark4() {
  MAX_PARTICLES = diam + 20;
  c = new color[] {color(190, 54, 90), color(176, 23, 85), color(70, 10, 89), color(26, 80, 95), color(25, 100, 98), color(359, 69, 100), color(49, 85, 97)};
}

void spark4() {

  if (count!= 0) {
    p.add(new Particle(width / 2, (int)y, MAX_PARTICLES, ball, vig));
  }

  for (int i = 0; i < p.size(); i++) {
    p.get(i).update();
    p.get(i).display((int)random(1,10));

    if (p.get(i).getCnt() <= 0) {
      p.remove(i);
    }
  }
}
class Particle {

  PVector position1; //位置ベクトル
  PVector position2; //位置ベクトル
  //PVector position3; //位置ベクトル
  PVector velocity1; //速度ベクトル
  PVector velocity2; //速度ベクトル
  //PVector velocity3; //速度ベクトル

  int x;
  int y;
  int s;
  color c;
  float amount;

  int cnt = MAX_PARTICLES;

  Particle(int _x, int _y, int _size, color _c, float _amount) {
    x= _x;
    y= _y;
    s= _size;
    c= _c;
    amount = _amount;

    position1 = new PVector(x, y);
    position2 = new PVector(x, y);
    //position3 = new PVector(x, y);
    velocity1 = new PVector(random( - 10, 10) * amount / vig_base, random( - 10, 10) * amount / vig_base);
    velocity2 = new PVector(random( - 15, 15) * amount / vig_base, random( - 15, 15) * amount / vig_base);
    //velocity3 = new PVector(random( - 20, 20) * amount / vig_base, random( - 20, 20) * amount / vig_base);
  }

  void update() {
    cnt = cnt - 6;//
    if (cnt <= 0) {
      cnt = 0;
    }
    position1.add(velocity1);
    position2.add(velocity2);
    //position3.add(velocity3);
  }

  void display(int _size_p) {
    int size_p = _size_p;
    fill(c, 220);
    ellipse(position1.x, position1.y, cnt / 16, cnt / 16);
    if (amount > 40) {
      ellipse(position2.x, position2.y, cnt / 13, cnt / 13);
    }
    if (amount > 80 && random(0,4)>1) {
      ellipse(width/2+random(diam*0.5, diam*2)*cos(random(0, 2*PI)), y+random(diam*0.5, diam*2)*sin(random(0, 2*PI)),size_p, size_p);
    }
  }

  int getCnt() {
    return cnt;
  }
}
