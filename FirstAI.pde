Perceptron brain;

Point[] points = new Point[200];
int trainingIndex = 0;




void setup() {
  size(800,800);
  brain = new Perceptron(3);
  
  for (int i = 0; i < points.length; i++){
   points[i] = new Point(); 
  }
}

void draw() {
  background(255);
  stroke(0);
  
  Point p1 = new Point(-1 ,f(-1));
  Point p2 = new Point(1 ,f(1));

  line(p1.PixelX(), p1.PixelY(),p2.PixelX(), p2.PixelY());
  
  Point p3 = new Point(-1,brain.guessY(-1));
  Point p4 = new Point(1,brain.guessY(1));
  line(p3.PixelX(), p3.PixelY(),p4.PixelX(), p4.PixelY());
  
  for (Point pt : points){
     pt.show();
  }
   for (Point pt : points){
     float[] inputs = {pt.x, pt.y, pt.bias};
     int target = pt.label;
     
     int guess = brain.guess(inputs);
     if (guess == target){
       fill(0,255,0);
     }else{
       fill(255,0,0);
     }
       noStroke();
       ellipse(pt.PixelX(), pt.PixelY(), 16, 16);
   }
     Point training = points[trainingIndex];
     float[] inputs = {training.x, training.y, training.bias};
     int target = training.label;
     brain.train(inputs, target);
     trainingIndex ++;
     if (trainingIndex == points.length){
      trainingIndex = 0; 
     }
}

/*void mousePressed(){
   for (Point pt : points){
       float[] inputs = {pt.x, pt.y};
       int target = pt.label;
       brain.train(inputs, target);
      
  }
}*/
