class Ball{
  
  int xpos;
  int ypos; 
  PVector angle;
  PVector velocity;
  PVector amplitude;
  
  Ball(int xpos_, int ypos_){
    xpos=xpos_;
    ypos=ypos_;
    angle = new PVector();
    velocity = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    amplitude = new PVector(random(20,width/2), random(20,height/2));


  }
  
  void display(String useword, int thenum, int tempstrokecolor, int temptextcolor){
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;

    pushMatrix();
    translate(width/2, height/2);
    stroke(strokecolor);
    strokeWeight(0.5);
    fill(temptextcolor, 200);
    line(0, 0, x, y); 
    textFont(f, thenum*2);
    text(useword,x,y);
   // fill(70);
    //ellipse(500, 500, 20, 20);
    popMatrix();
  }
  
  void move(){
     angle.add(velocity);
}
    
}
