  Ball[] balls;
  boolean clicked = false;
  
  void setup(){
    size(400, 400);
    background(0);
    balls = new Ball[25];
    for (int i=0; i < balls.length; i++) {
      balls[i] = new Ball();
    }
  }
  
  void draw(){
    background(0);
    for (int i = 0; i < balls.length; i++) {
      balls[i].move();
      fill(balls[i].c);
      stroke(0,0);
      ellipse(balls[i].x, balls[i].y, 10, 10);
    }
  }
  
  void mouseClicked(){
  }