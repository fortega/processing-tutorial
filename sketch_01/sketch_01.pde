// Todas las lineas que inician con // son comentarios y no se ejecutan.
// Los comentarios son importantes, pues nos permiten contar que estamos programando

// Referencias: https://processing.org/reference/

// Esta funcion se ejecuta solo una vez cuando inicia el programa

void setup(){
  //Establecemos el tamaño del dibujo
  size(300,300);
}

// Esta funcion se ejecuta cada 1/60 segundos. Aqui es donde más trabajaremos
void draw(){
  rect(75, 75, 150, 150);
  
  ellipseMode(CENTER);
  ellipse(150, 150, 75, 75);
}