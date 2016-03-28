// Ex2_3_1

/**
 * Muestra los colores que hay de distancia entre dos colores
 * 
 * MOUSE
 * left click          : new random color set
 * position x          : interpolation resolution
 * position y          : row count
 * 
 * KEYS
 * 1-2                 : switch interpolation style
 */
 
import generativedesign.*;
import processing.pdf.*;

int tileCountX = 2;
int tileCountY = 10;

color[] colorsLeft = new color[tileCountY];
color[] colorsRight = new color[tileCountY];
color[] colors;

boolean interpolateShortest = true;


void setup() { 
  size(700, 700);
  colorMode(HSB,360,100,100,100); 
  noStroke();
  shakeColors();
} 


void draw() { 

  tileCountX = (int) map(mouseX,0,width,2,100);
  tileCountY = (int) map(mouseY,0,height,2,10);
  float tileWidth = width / (float)tileCountX;
  float tileHeight = height / (float)tileCountY;
  color interCol;
  
  // just for ase export
  colors = new color[tileCountX*tileCountY];
  int i = 0;
  
  for (int gridY=0; gridY< tileCountY; gridY++) {
    color col1 = colorsLeft[gridY];
    color col2 = colorsRight[gridY];

    for (int gridX=0; gridX< tileCountX ; gridX++) { 
      float amount = map(gridX,0,tileCountX-1,0,1);
      
      if (interpolateShortest) {
        // switch to rgb
        colorMode(RGB,255,255,255,255);
        interCol = lerpColor(col1,col2, amount); 
        // switch back
        
      } 
      else {
        colorMode(HSB,360,100,100,100);
        interCol = lerpColor(col1,col2, amount); 
      }
      
      float posX = tileWidth*gridX;
      float posY = tileHeight*gridY;
      String colorMode = interpolateShortest ? "RGB" : "HSB";
      
      fill(interCol);
      rect(posX, posY, tileWidth, tileHeight); 
      
      // Imprimir codigo de colores
      fill(255,255,255);
      textSize(20);
      text(colorMode, width - 80, height - 20);
      textSize(12);
      text( hex(interCol, 6), posX + 10, posY + 20);
      // just for ase export
      colors[i] = interCol;
      i++;
    }
  }

} 

void mouseReleased() {
  shakeColors();
}

void shakeColors() {
  for (int i=0; i<tileCountY; i++) {
    colorsLeft[i] = color(random(0,60), random(0,100), 100);
    colorsRight[i] = color(random(160,190), 100, random(0,100));
  }
}

void keyReleased() {
  if (key == '1') interpolateShortest = !interpolateShortest;
}