import processing.core.*; 

import controlP5.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class cssgenerator extends PApplet {



ControlP5 cp5;
ColorPicker colp;
public int pixelsize = 15;


public void setup(){
  size(900,700);
  background(255);
  gui();
  grid();
}

public void gui(){  
  
  cp5 = new ControlP5(this);
                     
  cp5.addSlider("pixelsize")
     .setRange(1,30)
     .setPosition(height+floor(height%pixelsize)/2 + 10,10)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     ;
  colp = cp5.addColorPicker("picker")
        .setPosition(height+floor(height%pixelsize)/2 + 10 -100,100)
        .setColorValue(color(255,128,0,255))
        ;

}

public void grid(){
  //clear screen
  background(255);
  int widthx = height - floor((height%pixelsize)/2);
  int heightx = height - floor((height%pixelsize)/2);
  
   //vertical-lines
  for(int i = floor((height%pixelsize)/2);i<=widthx;i+=pixelsize){
    line(i,floor((height%pixelsize)/2),i,height - floor(height%pixelsize)/2);
  }
  
  //horizontal-lines
  for(int i = floor((height%pixelsize)/2);i<=heightx;i+=pixelsize){
    line(floor((height%pixelsize)/2),i,widthx,i);
  }
  
}

public void colorsqr(){
  if(mouseX<(height - floor((height%pixelsize)/2)) && mouseY<(height - floor((height%pixelsize)/2))){
    int x = mouseX - ((mouseX - floor((height%pixelsize)/2))%pixelsize);
    int y = mouseY - ((mouseY - floor((height%pixelsize)/2))%pixelsize);
    rectMode(CORNERS);
    fill(colp.getColorValue());
    noStroke();
    rect(x,y,x+pixelsize,y+pixelsize);
    print(y + ", ");
    println(x);
  }
}

public void draw(){

}

public void mouseClicked(){
  colorsqr();

}
  
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "cssgenerator" });
  }
}
