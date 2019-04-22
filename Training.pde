float f(float x) {
  //y = mx + b
  return 0.89 * x - 0.1;
}

class Point {
  float x;
  float y;
  float bias = 1;
  int label;
  
  Point(float x_, float y_){
    x = x_;
    y = y_;
    bias = 1;
  }
  
  
  Point(){
    x = random(-1,1);
    y = random(-1,1);
    
    float lineY = f(x);
    if (y > lineY){
      label = 1;
    }else {
      label = -1;
    }
  }
  
  float PixelX(){
     float px = map(x,-1,1,0,width);
     return px;
  }
  
  float PixelY(){
    float py = map(y,-1,1,height,0);
    return py;
  }
  
  void show(){
   stroke(0);
   if (label == -1){
     fill(0);
   } else{
     fill(255);
   }
   
   float px = PixelX();
   float py = PixelY();
   ellipse(px,py,24,24);
    
  }
  
}
