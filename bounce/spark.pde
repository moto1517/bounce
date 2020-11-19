int MAX_PARTICLES;
color[] c = {#69D2E7, #A7DBD8, #E0E4CC, #F38630, #FA6900, #FF4E50, #F9D423};
ArrayList<Particle> p = new ArrayList<Particle>();

void setup_spark() {
  MAX_PARTICLES = diam + 20;
}

void spark() {

  if (count!=0) {
    p.add( new Particle(width/2, (int)y, MAX_PARTICLES, c[(int)random(0, 7)]) );
  }

  for (int i=0; i<p.size(); i++) {
    p.get(i).update();
    p.get(i).display();

    if ( p.get(i).getCnt() <= 0 ) {
      p.remove(i);
    }
  }
}
class Particle {

  PVector position; //位置ベクトル
  PVector velocity; //速度ベクトル

  int x;
  int y;
  int s;
  color c;

  int cnt = MAX_PARTICLES;

  Particle(int _x, int _y, int _size, color _c) {
    x = _x;
    y = _y;
    s = _size;
    c = _c;

    position = new PVector(x, y);
    velocity = new PVector(random(-10, 10)*vig/vig_base, random(-10, 10)*vig/vig_base);
  }

  void update() {
    cnt = cnt - 6;//
    if (cnt<=0) {
      cnt = 0;
    }
    position.add(velocity);
  }

  void display() {

    fill(c, 220);
    if (MAX_PARTICLES -10 < cnt) {
      //float sz = random( s-10, s+10 );
      //ellipse(x +random(-5, 5), y +random(-5, 5), sz, sz );

      fill(255, 220);
      //ellipse(x +random(-5, 5), y +random(-5, 5), sz-50, sz-50 );
    }
    ellipse(position.x, position.y, (cnt/4)*(vig/vig_base), (cnt/4)*(vig/vig_base));
    ellipse(-position.x, -position.y, (cnt/4)*(vig/vig_base), (cnt/4)*(vig/vig_base));
  }

  int getCnt() {
    return cnt;
  }
}
