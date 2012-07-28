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
public int cpred = 100, cpblue = 100, cpgreen = 100, cpalpha = 100;


public void setup(){
  size(880,600);
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
  colorpicksetup();

}

public void colorpicksetup(){
  cp5.addSlider("cpred")
     .setRange(0,255)
     .setPosition(height+floor(height%pixelsize)/2 + 10,50)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     .setColorBackground(color(90))
     ;
  cp5.addSlider("cpblue")
     .setRange(0,255)
     .setPosition(height+floor(height%pixelsize)/2 + 10,80)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     .setColorBackground(color(70))
     ;
  cp5.addSlider("cpgreen")
     .setRange(0,255)
     .setPosition(height+floor(height%pixelsize)/2 + 10,110)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     .setColorBackground(color(50))
     ;  
  cp5.addSlider("cpalpha")
       .setRange(0,255)
       .setPosition(height+floor(height%pixelsize)/2 + 10,140)
       .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
       .setColorBackground(color(30))
       ;
}

public void colorpickcol(){
  cp5.getController("cpred").setColorForeground(color(cpred,0,0));
  cp5.getController("cpred").setColorActive(color(cpred,0,0));
  cp5.getController("cpblue").setColorForeground(color(0,0,cpblue));
  cp5.getController("cpblue").setColorActive(color(0,0,cpblue));
  cp5.getController("cpgreen").setColorForeground(color(0,cpgreen,0));
  cp5.getController("cpgreen").setColorActive(color(0,cpgreen,0));
  cp5.getController("cpalpha").setColorForeground(color(0,0,0,cpalpha));
  cp5.getController("cpalpha").setColorActive(color(0,0,0,cpalpha));
  fill(cpred,cpgreen,cpblue,cpalpha);
  noStroke();
  rectMode(CORNERS);
  rect(height+floor(height%pixelsize)/2 + 10,170,height+floor(height%pixelsize)/2 + 10 + width-height-floor(height%pixelsize)/2 - 20,250);
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
    fill(cpred,cpgreen,cpblue,cpalpha);
    noStroke();
    rect(x,y,x+pixelsize,y+pixelsize);
    print(y + ", ");
    println(x);
  }
}

public void draw(){
  colorpickcol();

}

public void mouseClicked(){
  colorsqr();
}

public void mouseDragged(){
  colorsqr();
}

  
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#F0F0F0", "cssgenerator" });
  }
}
