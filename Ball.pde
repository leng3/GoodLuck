  class Ball{
    color c;
    float rad;
    float x, y, dx, dy;
    int state;
    
    Ball(){
      float r = random(256);
      float g = random(256);
      float b = random(256);
      c = color(r, g, b);
      rad = 10;
      x = random((width - r) + r/2);
      y = random((height - r) + r/2);
      dx = random(10) -5;
      dy = random(10) - 5;
      fill(c);
      stroke(0,0);
      ellipse(x, y, rad, rad);
    }
    
    void bounce(){
      dx *= -1;
      dy *= -1;
    }
    
    void move(){
      x = x + dx;
      y = y + dy;
      if (x > width-20 || x < 20){
        dx = -dx;  
      }
      if (y > height-20 || y < 20){
        dy = -dy;  
      }
    }
    
    void grow(){
      rad+=1;
    }
    
  }