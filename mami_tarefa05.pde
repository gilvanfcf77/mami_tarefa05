float vInicialX = 0;
float vInicialY = 0;
float vInicial = 80;
float aAtual = -10;
float dAtualY;
float dAtualX;
int angle = 0;

import controlP5.*;
ControlP5 cp5;

void setup () {  
  size (640, 480);

  cp5 = new ControlP5(this);
  cp5.addSlider("angle")
    .setPosition(100, 100)
    .setSize(100, 30)
    .setRange(0, 90)
    .setNumberOfTickMarks(7);
}

void draw() {

  background (180);
  mostraMundo();
  desenhaViagem (vInicial, angle);
}


float MRU (float v, float t, int a) {
  float vHorizontal = cos (radians(a))*v;
  return vHorizontal*t;
}


float MRUV (float v, float acel, float t, int a) {
  float d;
  float vVertical = sin (radians(a))*v;
  d = vVertical*t + acel*t*t/2.0;
  return d;
}


void desenhaViagem (float v, int a) {
  vInicialX = vInicial * cos(radians(a));
  vInicialY = vInicial * sin(radians(a));

  for (int i = 0; i < 20; i++) {
    dAtualX = MRU (vInicialX, tAtual/10);
    dAtualY = MRUV(vInicialY, aAtual, a);

    fill (255, 0, 0);
    ellipse (dAtualX, height-dAtualY, 10, 10);
  }
}

//println(tAtual, dAtualX, dAtualY);
//  if (valor>0) {
//    dAtualY = MRUV(vInicialY, aAtual, tAtual/10);
//    dAtualX = MRU (vInicialX, tAtual/10);
//    fill(255, 0, 0);
//    ellipse(dAtualX, 600-dAtualY, 10, 10);
//    tAtual++;
//    if (dAtualY < 0) {
//      Imprime();
//      valor = 0;
//    }
//  }


void mostraMundo() {
  for (int i = 0; i < 50; i++) {
    line (i*40, 0, i*40, height);
    line (0, i*40, width, i*40);
  }
}
