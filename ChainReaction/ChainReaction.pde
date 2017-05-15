  Ball[] balls;
  boolean reactStarted;
  void setup(){
    reactStarted = false;
    size(400, 400);
    background(0);
    balls = new Ball[26];
    for (int i=0; i < balls.length; i++) {
      balls[i] = new Ball();
    }
  }
  
  void draw(){
    Ball b = null;
    background(0);
    for (int i = 0; i < balls.length; i++) {
      b = balls[i];
      b.move();
      //if you have a reacting ball, make it react:
      if (b.isExpanding()) {
        for (Ball c: balls) {
        //also, if it happens to be touching any other balls, r (Ball c : balls) {          
          //if a ball next to you isn't reacting already, make it react here
          if (b.isIntersecting(c) && !c.isReacting()) c.react();
        }
      }
      if (b.isReacting()) b.react();
      fill(b.getColor()); //fill color = ball color
      stroke(0,0);
      ellipse(b.getX(), b.getY(), b.getRadius(), b.getRadius());
    }

  }
  void mouseClicked() {
    if (!reactStarted) {
      Ball b = new Ball(25, 0.5, mouseX, mouseY, 0, 0);
      balls[25]=b;
      b.react();
      reactStarted = true;
    }
  }
