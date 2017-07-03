
color fondo_color = color(255,255,255);

float pelota_t = 5, pelota_x = 0, pelota_y = 0;
color pelota_color = color(255,0,255);

float pelota_vel_x = 10, pelota_vel_y = 15;

void setup(){
  size(400,400);
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
  background(fondo_color); //limpiamos
  
  dibuja_pelota();
}

void colision_pelota(){
  if(pelota_x >= width || pelota_x <= 0) pelota_vel_x *= -1; // choque horizontal
  if(pelota_y >= height || pelota_y <= 0) pelota_vel_y *= -1; // choque vertical
}

void mover_pelota(){
  pelota_x += pelota_vel_x;
  pelota_y += pelota_vel_y;
}

void dibuja_pelota(){
  ellipseMode(CENTER);
  fill(pelota_color);
  ellipse(pelota_x, pelota_y, pelota_t, pelota_t);
}