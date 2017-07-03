// Todas las lineas que inician con // son comentarios y no se ejecutan.
// Los comentarios son importantes, pues nos permiten contar que estamos programando

// Referencias: https://processing.org/reference/

// Esta funcion se ejecuta solo una vez cuando inicia el programa

int click = 0;
void setup(){
  //Establecemos el tamaño del dibujo
  size(300,300);
}

// Esta funcion se ejecuta cada 1/60 segundos. Aqui es donde más trabajaremos
void draw(){
  //limpiamos
  background(255);
  noFill();
  
  rect(75, 75, 150, 150);
  
  ellipseMode(CENTER);
  ellipse(150, 150, 75, 75);
  
  fill(0,0,255);
  text(click, mouseX, 10);
  
  fill(0,255,0);
  text(click, 10, mouseY);
  
  fill(255,0,0);
  text(click, mouseX, mouseY);
}

void mousePressed(){
  if(mouseButton == LEFT){
    click++;
  }else if(mouseButton == RIGHT){
    click--;
  }else{
    click = 0;
  }
}