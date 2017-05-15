  class Ball{
    private color c;
    //starting radius, max radius. min radius=0
    private float rad;
    private float x, y, dx, dy;
    //state < 0: shrinking
    //state = 0: no reaction
    //state > 0: expanding
    private float state, _growth, max;
    Ball(){
      this(15, 0.5);
    }
    Ball(float radius, float growth, float newX, float newY, float newDx, float newDy) {
      this(radius, growth);
      dx= newDx;
      dy= newDy;
      x = newX;
      y = newY;
    }
    //declare a ball with smaller radius
    Ball(float radius, float growth) {
      float r = random(256);
      float g = random(256);
      float b = random(256);
      c = color(r, g, b);
      state = 0;
      _growth = growth;
      rad = radius;
      max = rad*4;
      //to stop bounce loops, there must be one ball of space from the wall for all starts
      //ie all balls spawn in interval (2*rad,max-2*rad)
      x = random(width - 4*rad) + 2*rad;
      y = random(height - 4*rad) + 2*rad;
      dx = random(10) -5;
      dy = random(10) - 5;
      fill(c);
      stroke(0,0);
      ellipse(x, y, rad, rad);
    }
    //add (dx, dy) to the ball
    void move(){
      x = x + dx;
      y = y + dy;
      bounce();
    }
    //check to see if youre near a ball and need to bounce
    void bounce(){
      if (x > width-rad || x < rad){
        dx = -dx;
      }
      if (y > height-rad || y < rad){
        dy = -dy;  
      }
    }
    
    void react(){
      dx=0;
      dy=0;
      if (!isReacting()) {
        //if it's not reacting, make it start to grow
        state=_growth;
      }
      if (rad > max) {
        //if the radius is slightly bigger than the max, make it start to shrink
        state *= -1;
        //and set the radius to max for good measure:
        rad = max;
      }
      if (rad > 0)
      rad+=state;
      
    }
    
    
    //returns if two circles are intersection (ie have a point of intersection):
    boolean isIntersecting(Ball other) {
      //the balls are just circles, so we can just check if 
      //the distance between them is less than the sum of their radii
      //ie ||B-A||^2  < r1+r2
      //norm squared:
      float norm2 = (getX()-other.getX())*(getX()-other.getX())
                  + (getY()-other.getY())*(getY()-other.getY());
      float sumR = getRadius() + other.getRadius();
      return norm2 < sumR*sumR;
    }
    //accessors:
    color getColor() {return c;}
    float getX() {return x;}
    float getY() {return y;}
    float getDx() {return dx;}
    float getDy() {return dy;}
    float getRadius() {return rad;}
    float getState() {return state;}
    
    //bools:
    boolean isReacting() {return state != 0;}
    boolean isExpanding() {return state > 0;}
    boolean isShrinking() {return state < 0;}

    
    
  }
