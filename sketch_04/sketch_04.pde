// Todas las lineas que inician con // son comentarios y no se ejecutan.
// Los comentarios son importantes, pues nos permiten contar que estamos programando

// Referencias: https://processing.org/reference/

// Esta funcion se ejecuta solo una vez cuando inicia el programa

int ncuadrados = 4;
int ncirculos_x = 12;
int ncirculos_y = 12;
void setup(){
  //Establecemos el tamaño del dibujo
  size(600,600);
}

// Esta funcion se ejecuta cada 1/60 segundos. Aqui es donde más trabajaremos
void draw(){
  //limpiamos fondo
  background(255);
  
  //Sin relleno
  noFill();
  
  //Cuadrados
  for(int i = 0; i < ncuadrados; i++){
    rect(i*width/ncuadrados, 0, width/ncuadrados, height);
  }
  
  //Elipses
  ellipseMode(CORNER);
  for(int i = 0; i < ncirculos_x; i++){
    for(int j = 0; j < ncirculos_y; j++){
      ellipse(
        i*width/ncirculos_x,
        j*height/ncirculos_y,
        width/ncirculos_x,
        height/ncirculos_y);
    }
  }
}