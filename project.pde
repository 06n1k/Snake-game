float x, y;
float xsnake, ysnake;
float speed = 2;
int direction = 0;
int sped = 2;
float bodyX[] = new float[100];
float bodyY[] = new float[100];
int bodylength = 0;

void setup(){
  size(400,400);
  x = random(width);
  y = random(height);
  xsnake = width/2;
  ysnake = height/2;
}

void draw(){
  background(253,253,150);
  drawApple(x,y);
  drawSnake(xsnake,ysnake);
  moveSnake();
  checkApple();
  if (sped == 0){ //up
    ysnake -= speed;
  }
  if (sped == 1){ //down
    ysnake += speed;
  }
  if (sped == 2){ //right
    xsnake += speed;
  }
  if (sped == 3){ //left
    xsnake -= speed;
  }
  
  if (xsnake > width){
   xsnake = -1; 
  }
  else if (xsnake < 0){
    xsnake =width +1; 
  }
  if (ysnake > height){
   ysnake = -1; 
  }
  else if (ysnake < 0){
    ysnake =height +1; 
  }
}

void drawSnake(float x, float y){
  noStroke();
  fill(4,185,118);
  circle(x,y,25);
  
  for(int i = 0; i<bodylength; i++){
   fill(4,185,118);
   circle(bodyX[i],bodyY[i],25); 
  }
  
  fill(0,0,0);
  if(direction == 0){ // right
    circle(x+7,y-7,5);
    circle(x+7,y+7,5);
  }
  if(direction == 1){ // left
    circle(x-7,y-7,5);
    circle(x-7,y+7,5);
  }
  if(direction == 2){ // up
    circle(x+7,y-7,5);
    circle(x-7,y-7,5);
  }
  if(direction == 3){ // down
    circle(x+7,y+7,5);
    circle(x-7,y+7,5);
  }
}

void moveSnake(){
 for(int i = bodylength - 1; i>0; i--){
   bodyX[i] = bodyX[i-1];
   bodyY[i] = bodyY[i-1];
 }
 if (bodylength > 0){
  bodyX[0] = xsnake;
  bodyY[0] = ysnake;
 }
}

void drawApple(float x, float y){
  noStroke();
  fill(255,0,0);
  circle(x,y,20);
}

void checkApple(){
 if(dist(xsnake,ysnake,x,y)<18){
  x = random(width);
  y = random(height);
  bodylength++;
 }
}

void keyPressed(){
  if(key == 'w'||key == 'W'|| keyCode == UP){
    ysnake -= 3;
    direction  = 2;
    sped = 0;
  }
  if(key == 's'||key == 'S'|| keyCode == DOWN){
    direction  = 3;
    sped  = 1;
  }
  if(key == 'd'||key == 'D'|| keyCode == RIGHT){
    direction = 0;
    sped = 2;
  }
  if(key == 'a'||key == 'A'|| keyCode == LEFT){
    direction = 1;
    sped = 3;
  }
}
