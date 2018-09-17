float vInicial = 80;
float aAtual = -10;
float dX;
float dY;
int angle = 45;


import controlP5.*;
ControlP5 cp5, tg;

void setup () { 
  size (800, 600);
  cp5 = new ControlP5(this);
  cp5.addSlider("angle")
    .setPosition(50, 50)
    .setSize(100, 30)
    .setRange(0, 90)
    .setColorForeground(color(15, 15, 180))
    .setColorActive(color(15, 30, 255));
}

void draw() {
  background (200);
  mostraMundo();
  desenhar (vInicial, angle);
}


void desenhar (float v, int a) {
  for (int i = 0; i < 20; i++) {
    dX = MRU (v, i, a);
    dY = MRUV (v, aAtual, i, a);
    fill (0, 0, 255);
    noStroke();
    ellipse (dX, height-dY, 10, 10);
  }
}


void mostraMundo() {
  stroke(0, 0, 0);
  strokeWeight(1);
  for (int i = 0; i < 16; i++) {

    line(i * 50, 0, i * 50, 800);
    line(0, i * 50, 800, i * 50);
  }
}

float MRU (float v, float t, int a) {
  float vX = cos (radians(a))*v;
  return vX*t;
}


float MRUV (float v, float acel, float t, int a) {
  float d;
  float vY = sin (radians(a))*v;
  d = vY*t + acel*t*t/2.0;
  return d;
}
