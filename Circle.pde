class Circle{
  String keywords;
  
  Circle(){  
  }
  
  void display(String tempkeywords){
   textFont(f,20);
   fill(220);
   //text(tempkeywords,480, 480); 
   ellipse(480, 480, 10, 10);  
  }
  void drawcircle(int temptypenum){
    fill(220);
    noStroke();
   ellipse(440+random(-5,5)+temptypenum*int(random(-5,5)), 480+random(-5,5)+temptypenum*int(random(-5, 5)), 20+temptypenum*2, 20+temptypenum*2);
   //ellipse(480+int(random(-20, 20)), 480+int(random(-10, 10)), 40, 40);
   //ellipse(480+int(random(-2, 2)), 480+int(random(-2, 2)), 50, 50);
    
    
  }
  
}

