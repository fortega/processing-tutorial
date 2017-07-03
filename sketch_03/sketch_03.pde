// Todas las lineas que inician con // son comentarios y no se ejecutan.
// Los comentarios son importantes, pues nos permiten contar que estamos programando

// Referencias: https://processing.org/reference/

// Esta funcion se ejecuta solo una vez cuando inicia el programa

float cuadrado = 25;
float elipse = 50;
boolean dibujaCursor = true;
void setup(){
  //Establecemos el tamaño del dibujo
  size(600,600);
  
  if(dibujaCursor){
    noCursor();
  }
}

// Esta funcion se ejecuta cada 1/60 segundos. Aqui es donde más trabajaremos
void draw(){
  //limpiamos fondo
  background(255);
  
  //Sin relleno
  noFill();
  
  //Cuadrados
  rect(150, 150, cuadrado, cuadrado);
  
  //Elipse
  ellipseMode(CORNER);
  ellipse(0, 0, elipse, elipse);
  
  //Puntero Mouse
  if(dibujaCursor){
    fill(0);
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,10,10);
  }
  
  // Cursor fijo en Y
  fill(0,0,255);
  text(mouseX, mouseX, 10);
  
  //Cursor fijo en X
  fill(0,255,0);
  text(mouseY, 10, mouseY);
}