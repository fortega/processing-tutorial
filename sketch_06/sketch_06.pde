// Todas las lineas que inician con // son comentarios y no se ejecutan.
// Los comentarios son importantes, pues nos permiten contar que estamos programando

// Referencias: https://processing.org/reference/

// Esta funcion se ejecuta solo una vez cuando inicia el programa

int click = 0;
float cursor = 25;
boolean dibujaCursor = true;
color[] coloresCursor = new color[3];
color[] coloresElipse = new color[10];
int nColor = 0;
void setup(){
  //Establecemos el tamaño del dibujo
  size(600,600);
  
  //Eliminamos el cursor
  noCursor();
  
  //Establecemos colores
  coloresCursor[0] = color(255,0,0);
  coloresCursor[1] = #00FF00;
  coloresCursor[2] = color(0,0,255);
  
  coloresElipse[0] = color(255,0,0);
  coloresElipse[1] = color(255,255,0);
  coloresElipse[2] = color(0,255,255);
  coloresElipse[3] = color(255,0,255);
  coloresElipse[4] = color(255,255,0);
  coloresElipse[5] = color(10,30,190);
  coloresElipse[6] = color(65,1,45);
  coloresElipse[7] = color(255,255,255);
  coloresElipse[8] = color(100,150,150);
  coloresElipse[9] = color(0,0,0);
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
  
  int nColElipse = 0;
  for(int i = 0; i < 4; i++){
    for(int j = 0; j < 4; j++){
      fill(coloresElipse[nColElipse]);
      ellipse(i*width/4, j*height/4, width/4, height/4);
      
      nColElipse++;
      if(nColElipse >= coloresElipse.length){
        nColElipse = 0;
      }
    }
  }
  
  //Puntero Mouse
  fill(coloresCursor[nColor]);
  ellipseMode(CENTER);
  ellipse(mouseX,mouseY,cursor,cursor);
  
  // Cursor fijo en Y
  fill(0,0,0);
  text(click, mouseX, 10);
  
  //Cursor fijo en X
  fill(0,0,0);
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
  }
  
  nColor++;
  if(nColor >= coloresCursor.length){
    nColor = 0;
  }
}