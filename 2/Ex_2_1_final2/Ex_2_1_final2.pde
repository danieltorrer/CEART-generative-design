/* 2.1 Color

*/

boolean recording = false;
int contador = 0;

void setup(){
  size(720, 720);
  //noCursor();
  frameRate(60);
  
  colorMode(HSB, 360, 100, 100);
  rectMode(CENTER);
}

void draw(){
  noStroke();
  //background(mouseY/2, 100, 100);
    
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      fill( 360 - mouseY/2, 60, 100);
      rect( width / 3 * i + 120, height / 3 * j + 120, width / 3, height / 3 );
      
      fill( 360 - mouseY/4, 30, 100);
      int signo = i % 2 == 0 ? -220 : 0;
      int ancho =  ((mouseX/3)+1) + signo ;
      println(ancho);
      rect( width / 3 * i + 120, height / 3 * j + 120, ancho, ancho);
      contador++;
    }
  }
  
  if (recording) saveFrame("#####.png");
}

void keyPressed() {
  if (key=='s' || key=='S') {
    recording = !recording;
  }
}