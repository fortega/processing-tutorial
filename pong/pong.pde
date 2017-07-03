
color fondo_color = color(0,0,0);

float pelota_t = 5, pelota_x = width/2, pelota_y = height/2;
float pelota_vel_x = 3, pelota_vel_y = 3, pelota_vel_max = 50;
color pelota_color = color(255,255,255);

color texto_color = pelota_color;

color linea_color = texto_color;

color paleta_color = pelota_color;
int paleta_x = 2, paleta_y = 25;

int p1_x = 10, p1_y = 0, p2_x = width - p1_x, p2_y = 0;
int p1_puntaje = 0, p2_puntaje = 0;

boolean debug = true;
void setup(){
  size(400,300);
  frameRate(60);
  noStroke();
  noCursor();
}

void draw(){
  Procesar();
  Dibujar();
}

void Procesar(){
  mover_pelota();
  mover_paleta();
  colision_pelota();
}

void Dibujar(){
  dibuja_fondo();
  dibuja_puntaje();
  dibuja_pelota();
  dibuja_paleta();
}

void colision_pelota(){
  
  //Choque paleta 1
  if(abs(pelota_x-p1_x) < abs(pelota_vel_x) && pelota_vel_x < 0){ //distancia menor a avance
    if(abs(p1_y - pelota_y) <= paleta_y/2) pelota_vel_x *= -1;
  }
  
  //cambiamos sentido pelota al salir
  if(pelota_x >= width || pelota_x <= 0) pelota_vel_x *= -1; // choque horizontal
  if(pelota_y >= height || pelota_y <= 0) pelota_vel_y *= -1; // choque vertical
  
  //contamos puntos
  if(pelota_x >= width) p1_puntaje++; // choque a la derecha
  if(pelota_x <= 0) p2_puntaje++; // choque a la izquiera
  
}

void mover_pelota(){
  pelota_x += pelota_vel_x;
  pelota_y += pelota_vel_y;
}

void mover_paleta(){
  p1_y = mouseY;
  
  if(p1_y < paleta_y/2) p1_y = paleta_y/2; // si sale la paleta hacia arriba
  if(p1_y > height-paleta_y/2) p1_y = height-paleta_y/2; // si sale la paleta hacia abajo
}

void dibuja_fondo(){
  background(fondo_color); //limpiamos
  rectMode(CORNER);
  fill(linea_color); rect(width/2-1,0,2,height); //Linea al medio
}

void dibuja_pelota(){
  ellipseMode(CENTER);
  fill(pelota_color);
  ellipse(pelota_x, pelota_y, pelota_t, pelota_t);
}

void dibuja_paleta(){
  rectMode(CENTER);
  fill(paleta_color);
  rect(p1_x,p1_y,paleta_x,paleta_y);
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
  text("Player1: " + p1_puntaje, 0,height);
  
  //Puntaje Player 2
  textSize(16);
  textAlign(RIGHT);
  text("Player2: " + p2_puntaje, width,height);
}