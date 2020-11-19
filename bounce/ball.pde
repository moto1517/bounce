import processing.sound.*;
SoundFile bounce;

float y, speedX, speedY;
float g ;
int ta_time = 0;//テーブルでボールが跳ね返ったタイミング
int ra_time = 0;//ラケットでボールが跳ね返ったタイミング
int count = 0;
float vig = 0;//ボールがｶﾞｶﾞｶﾞｶﾞ！となる激しさ。vig_base-(ラケット←→テーブルを移動するボールの時間)

//stop=trueで、強く押し付けるとボールが止まる。falseだと跳ね続ける。
final boolean stop = true;
final int diam = 150;
final float gravity = 0.45;
final float diam_top = 0.6;
final int vig_base = 100;
color ball = color(253, 185, 51);
//final color ball = color(255, 254, 247);
//final color ball = color(255);
final color table = color(41, 68, 29);
//final color table = color(0);
//final color table = color(0, 58, 117);

void setup_ball() {
  y = height/2;
  speedX = 0;
  speedY = 0;
  g = gravity;

  bounce = new SoundFile(this, "bounce.mp3");
}

void ball() {
  fill(ball);
  if (y==height-diam/2) {
    ellipse(width/2, y + (diam/2)*(1-dis_y), ((height-y-diam/2)*diam_top+diam)*dis_x, ((height-y-diam/2)*diam_top+diam)*dis_y);
  } else {
    ellipse(width/2, y - (diam/2)*(1-dis_y), ((height-y-diam/2)*diam_top+diam)*dis_x, ((height-y-diam/2)*diam_top+diam)*dis_y);
  }
  //ellipse(width*0.1, y, diam, diam);

  y += speedY;
  speedY += g;
  dis_x=1;
  dis_y=1;

  //ラケットで反射
  if (y < mouseY+diam/2) {
    if (speedY<0) {
      bounce.play();
      speedY = speedY * -1;
      if (mouseY>height*0.75) {
        dis_x=1.1;
        dis_y=0.9;
      }
      if (millis()-ta_time<vig_base) {
        count++;
        vig = vig_base - (millis()-ta_time);
        if (mousePressed) {
          count = 0;
          g = 0;
          speedY=0;
          y=height-diam/2;
        }
      }
      if (millis()-ta_time>500) {
        count=0;
      }
      ra_time=millis();
    }
  }

  //テーブルで反射
  if ( y > height-diam/2 && speedY!=0) {
    bounce.play();
    y= height-diam/2;
  //  if (mouseY>height/4) {
      dis_x=1.1;
      dis_y=0.9;
  //  }
    //カーソルが画面上部にあるとボールが手元までバウンド
    if (mouseY < height/2) {
      speedY = -sqrt(2 * (height-mouseY-diam*1.2) * g);
    } else {
      speedY = speedY * -0.8;
    }
    if (millis()-ra_time<vig_base) {
      count++;
      vig = vig_base - (millis() - ra_time);
      if (mousePressed) {
        count = 0;
        g = 0;
        speedY=0;
        y=height-diam/2;
      }
    }
    if (millis()-ra_time>vig_base) {
      count=0;
      vig = 0;
    }
    ta_time=millis();
  }

  if (count>5 && mouseY > height-diam*0.75 && stop) {
    count = 0;
    g = 0;
    speedY=0;
    y=height-diam/2;
  }

  if (speedY==0&&y==height-diam/2&&mouseY<height/2) {
    speedY = -sqrt(2 * (height-mouseY-diam*1.2) * gravity);
    g = gravity;
  }
}
