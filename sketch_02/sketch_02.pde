// Todas las lineas que inician con // son comentarios y no se ejecutan.
// Los comentarios son importantes, pues nos permiten contar que estamos programando

// Referencias: https://processing.org/reference/

// Esta funcion se ejecuta solo una vez cuando inicia el programa

int click = 0;
float cursor = 25;
boolean dibujaCursor = true;
void setup(){
  //Establecemos el tamaño del dibujo
  size(600,600);
  
  //Eliminamos el cursor
  noCursor();
}

// Esta funcion se ejecuta cada 1/60 segundos. Aqui es donde más trabajaremos
void draw(){
  //limpiamos fondo
  background(255);
  
  //Sin relleno
  noFill();
  
  //Cuadrados
  for(int i = 0; i < 4; i++){
    rect(i*width/4, 0, width/4, height);
  }
  
  //Elipses
  ellipseMode(CORNER);
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      ellipse(i*width/4, j*height/4, width/4, height/4);
    }
  }
  
  //Puntero Mouse
  if(dibujaCursor){
    fill(0);
    ellipseMode(CENTER);
    ellipse(mouseX,mouseY,cursor,cursor);
  }
  
  // Cursor fijo en Y
  fill(0,0,255);
  text(click, mouseX, 10);
  
  //Cursor fijo en X
  fill(0,255,0);
  text(click, 10, mouseY);
  
  // Cursor libre
  fill(255,0,0);
  text(click, mouseX, mouseY);  
}


//Evento de apretar un boton
void mousePressed(){
  if(mouseButton == LEFT){
    // click = click + 1;
    click++;
  }else if(mouseButton == RIGHT){
    //click = click - 1;
    click--;
  }else{
    dibujaCursor = !dibujaCursor;
  }
}