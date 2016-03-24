// P_1_2_3_01.pde
// 
/**
 * generates specific color palettes  
 * 
 * MOUSE
 * position x/y        : row and coloum count
 * 
 * KEYS
 * 0-9                 : creates specific color palettes
 * s                   : save png
 */

int tileCountX = 100;
int tileCountY = 100;

// arrays for color components values
int[] hueValues = new int[tileCountX];
int[] saturationValues = new int[tileCountX];
int[] brightnessValues = new int[tileCountX];


void setup() { 
  size(600,600); 
  colorMode(HSB,360,100,100,100);
  noStroke();

  // Creamos los colores por canal
  for (int i=0; i<tileCountX; i++) {
    hueValues[i] = (int) random(0,360);
    saturationValues[i] = (int) random(0,100);
    brightnessValues[i] = (int) random(0,100);
  }
} 


void draw() { 
 
  // white back
  background(0,0,100);

  // count every tile
  int counter = 0;

  // map mouse to grid resolution
  int currentTileCountX = (int) map(mouseX, 0,width, 1,tileCountX);
  int currentTileCountY = (int) map(mouseY, 0,height, 1,tileCountY);
  float tileWidth = width / (float) currentTileCountX;
  float tileHeight = height / (float) currentTileCountY;

  for (int gridY = 0; gridY < tileCountY; gridY++) {
    for (int gridX = 0; gridX < tileCountX; gridX++) {  
      float posX = tileWidth * gridX;
      float posY = tileHeight * gridY;
      int index = counter % currentTileCountX;

      // get component color values
      fill( hueValues[index], saturationValues[index], brightnessValues[index]);
      rect( posX, posY, tileWidth, tileHeight);
      counter++;
    }
  }
} 


void keyReleased() {
  if (key == 's' || key == 'S') saveFrame("##_##.png");
  if (key == '1') {
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = (int) random(0,100);
      brightnessValues[i] = (int) random(0,100);
    }
  }
  if (key == '2') { 
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = (int) random(0,100);
      brightnessValues[i] = 100;
    }
  }
  if (key == '3') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,360);
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    }
  } 

  if (key == '4') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 0;
      saturationValues[i] = 0;
      brightnessValues[i] = (int) random(0,100);
    }
  }
  if (key == '5') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 195;
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    }
  }
  if (key == '6') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 195;
      saturationValues[i] = (int) random(0,100);
      brightnessValues[i] = 100;
    }
  }

  if (key == '7') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(0,180);
      saturationValues[i] = (int) random(80,100);
      brightnessValues[i] = (int) random(50,90);
    }
  }
  if (key == '8') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = (int) random(180,360);
      saturationValues[i] = (int) random(80,100);
      brightnessValues[i] = (int) random(50,90);
    }
  }

  if (key == '9') {
    for (int i=0; i<tileCountX; i++) {
      if (i%2 == 0) {
        hueValues[i] = (int) random(0,360);
        saturationValues[i] = 100;
        brightnessValues[i] = (int) random(0,100);
      } 
      else {
        hueValues[i] = 195;
        saturationValues[i] = (int) random(0,100);
        brightnessValues[i] = 100;
      }
    }
  }
  if (key == '0') {  
    for (int i=0; i<tileCountX; i++) {
      if (i%2 == 0) {
        hueValues[i] = (int) 192;
        saturationValues[i] = (int) random(0,100);
        brightnessValues[i] = (int) random(10,100);
      } 
      else {
        hueValues[i] = 273;
        saturationValues[i] = (int) random(0,100);
        brightnessValues[i] = (int) random(10,90);
      }
    }
  }

}