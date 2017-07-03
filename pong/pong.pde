
color fondo_color = color(0,0,0);

float pelota_t = 5, pelota_x = width/2, pelota_y = height/2;
float pelota_vel_x = 1, pelota_vel_y = 1, pelota_vel_max = 10;
color pelota_color = color(255,255,255);

color texto_color = pelota_color;

color linea_color = texto_color;

int choque_iz = 0, choque_de = 0;
boolean debug = true;
void setup(){
  size(400,300);
  frameRate(60);
  noStroke();
}

void draw(){
  Procesar();
  Dibujar();
}

void Procesar(){
  mover_pelota();
  colision_pelota();
}

void Dibujar(){
  dibuja_fondo();
  dibuja_puntaje();
  dibuja_pelota();
}

void colision_pelota(){
  
  //cambiamos sentido pelota
  if(pelota_x >= width || pelota_x <= 0) pelota_vel_x *= -1; // choque horizontal
  if(pelota_y >= height || pelota_y <= 0) pelota_vel_y *= -1; // choque vertical
  
  //contamos puntos
  if(pelota_x >= width) choque_de++; // choque a la derecha
  if(pelota_x <= 0) choque_iz++; // choque a la izquiera
  
  if((pelota_x >= width || pelota_x <= 0) && abs(pelota_vel_x) < pelota_vel_max) pelota_vel_x *= 1.25; // aceleramos tras choque X
  if((pelota_y >= height || pelota_y <= 0) && abs(pelota_vel_y) < pelota_vel_max) pelota_vel_y *= 1.1; // aceleramos tras choque
}

void mover_pelota(){
  pelota_x += pelota_vel_x;
  pelota_y += pelota_vel_y;
}

void dibuja_fondo(){
  background(fondo_color); //limpiamos
  fill(linea_color); rect(width/2-1,0,2,height); //Linea al medio
}

void dibuja_pelota(){
  ellipseMode(CENTER);
  fill(pelota_color);
  ellipse(pelota_x, pelota_y, pelota_t, pelota_t);
}

void dibuja_puntaje(){
  fill(texto_color);
  
  if(debug){
    textSize(8);
    textAlign(LEFT);
    text("X: " + pelota_x, 0,10);
    text("Y: " + pelota_y, 0,20);
    text("Vel: " + sqrt(pow(pelota_vel_x,2)+pow(pelota_vel_y,2)) + " (" + pelota_vel_x + "," + pelota_vel_y + ")", 0, 30);
  }
  
  //Puntaje Player 1
  textSize(16);
  textAlign(LEFT);
  text("P1: " + choque_de, 0,height);
  
  //Puntaje Player 2
  textSize(16);
  textAlign(RIGHT);
  text("P2: " + choque_iz, width,height);
}