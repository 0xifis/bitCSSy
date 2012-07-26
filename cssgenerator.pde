int pixelsize = 10;

void setup(){
  size(500,500);
  background(255);
}

void grid(){
  //vertical-lines
  for(int i = pixelsize;i<width;i+=pixelsize){
    line(i,0,i,height);
  }
  //horizontal-lines
}

void draw(){
  grid();
}
  
