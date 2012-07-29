import controlP5.*;

PrintWriter cssfile;
int filenum = 1;
ControlP5 cp5;
public int pixelsize = 30, pixnumx = -1, pixnumy = -1, pixnum = 0;
public int cpred = 100, cpblue = 100, cpgreen = 100, cpalpha = 100;


void setup(){
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
     .lock()
     ;
  colorpicksetup();
//  toolssetup();

}

public void toolssetup(){
    cp5.addBang("eraser")
     .setPosition(40, 300)
     .setSize(280, 40)
     .setTriggerEvent(Bang.RELEASE)
     .setLabel("eraser")
     .lock()
     ;
}

public void eraser(){
  cpred=cpblue=cpgreen=cpalpha=255;
}

public void colorpicksetup(){
  cp5.addSlider("cpred")
     .setRange(0,255)
     .setPosition(height+floor(height%pixelsize)/2 + 10,50)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     .setColorBackground(color(90))
     .lock()
     ;
  cp5.addSlider("cpblue")
     .setRange(0,255)
     .setPosition(height+floor(height%pixelsize)/2 + 10,80)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     .setColorBackground(color(70))
     .lock()
     ;
  cp5.addSlider("cpgreen")
     .setRange(0,255)
     .setPosition(height+floor(height%pixelsize)/2 + 10,110)
     .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
     .setColorBackground(color(50))
     .lock()
     ;  
  cp5.addSlider("cpalpha")
       .setRange(0,255)
       .setPosition(height+floor(height%pixelsize)/2 + 10,140)
       .setSize(width-height-floor(height%pixelsize)/2 - 20,30)
       .setColorBackground(color(30))
       .lock()
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
  rectMode(CORNERS);
  rect(0,0,width,height);
  int widthx = height - floor((height%pixelsize)/2);
  int heightx = height - floor((height%pixelsize)/2);
  
   //vertical-lines
  for(int i = floor((height%pixelsize)/2);i<=widthx;i+=pixelsize){
    line(i,floor((height%pixelsize)/2),i,height - floor(height%pixelsize)/2);
    pixnumx++;
  }
  
  //horizontal-lines
  for(int i = floor((height%pixelsize)/2);i<=heightx;i+=pixelsize){
    line(floor((height%pixelsize)/2),i,widthx,i);
    pixnumy++;
  }
  pixnum = pixnumx*pixnumy;
  println(pixnum);
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

public String formatstr(String ufstr, String delim){
  String[] fstr = split(ufstr, delim);
  if(fstr.length == 5){
    fstr[1] = "ffffff";
  }
  println(fstr.length);
  for(int i = 0;i<fstr.length;i++){
  println(fstr[i]);
  }
  return("#"+fstr[1]);
} 

public String colnullcheck(String chcol){
  if(chcol == "" || chcol == null){
    chcol = "ffffff";
  }
  return(chcol);
}

public String comorsemicol(int i){
  if(i != pixnum){
    return(",");
  }
  else{
    return(";");
  }
}

void generate(){
  cssfile = createWriter("avatar"+filenum+".css");
  cssfile.println(".avatar"+filenum+" {");
  cssfile.println("    height: "+pixelsize+"px;");
  cssfile.println("    width: "+pixelsize+"px;");
  cssfile.println("    box-shadow:");
  int bposx = floor((height%pixelsize)/2) + 2;
  int bposy = bposx;
  int j = 1;
  for(int i = 1;i<=pixnum;i++){
    int posx = bposx + ((i-1)%pixnumx)*pixelsize;
    int posy = bposy + ((j-1)%pixnumy)*pixelsize;
    cssfile.println("        "+(posx-bposx)+"px "+(posy-bposy)+"px"+" 0 "+formatstr(hex(get(posx,posy)),"FF")+comorsemicol(i));
    println(colnullcheck(formatstr(hex(get(posx,posy)),"FF"))+" , "+posx+" , "+posy);
    if(i%pixnumx==(pixnumx-1)){
      j++;
    }
      
  }
  cssfile.println("}");
  cssfile.flush();
  cssfile.close();
  println("generated avatar"+(filenum)+".css");
  filenum++;
    
  
}

void draw(){
  colorpickcol();

}

void mouseClicked(){
  colorsqr();
}

void mouseDragged(){
  colorsqr();
}

void keyPressed(){
  if(key=='s'||key=='S'){
    generate();
  }
}

  
