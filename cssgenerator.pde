import controlP5.*;

ControlP5 cp5;
ControlWindow controlWindow;
ColorPicker colpicker;
public int pixelsize = 40;


void setup(){
  size(500,500);
  cp5 = new ControlP5(this);
  controlWindow = cp5.addControlWindow("controlP5window",100,100,400,200)
                     .hideCoordinates()
                     .setBackground(color(40))
                     ;
                     
  cp5.addSlider("pixelsize")
     .setRange(1,30)
     .setPosition(10,10)
     .setSize(200,29)
     .setWindow(controlWindow)
     ; 
  background(255);
    grid();
    colpicker.render();
}

void grid(){
  //clear screen
  background(255);
  int widthx = width - floor((width%pixelsize)/2);
  int heightx = height - floor((height%pixelsize)/2);
  
   //vertical-lines
  for(int i = floor((width%pixelsize)/2);i<=widthx;i+=pixelsize){
    line(i,floor((height%pixelsize)/2),i,height - floor(height%pixelsize)/2);
  }
  
  //horizontal-lines
  for(int i = floor((width%pixelsize)/2);i<=heightx;i+=pixelsize){
    line(floor((width%pixelsize)/2),i,widthx,i);
  }
  
}

void colorsqr(){
  int x = mouseX - ((mouseX - floor((width%pixelsize)/2))%pixelsize);
  int y = mouseY - ((mouseY - floor((height%pixelsize)/2))%pixelsize);
  rectMode(CORNERS);
  fill(0);
  noStroke();
  rect(x,y,x+pixelsize,y+pixelsize);
  print(y + ", ");
  println(x);

  
}

void draw(){

}

void mouseClicked(){
  colorsqr();

}
  
