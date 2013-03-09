ornaments theOrn[];
int number,loc;
float x, y;
boolean fits;
PImage port,out;



//scene check variable
int time;


void setup()
{ 
  size(700, 700);
  number=18;
  theOrn = new ornaments[number];
  fits=false;
  
  port=loadImage("portrait.jpg");
  out=createImage(port.width,port.height,RGB);
  port.loadPixels();
  out.loadPixels();
  
  for(int y=0; y<port.height;y++)
  { for(int x=0;x<port.width;x++)
    { loc=x+y*port.width;
      out.pixels[loc]=port.pixels[loc];
    }
  }

  for (int i=0; i<number;i++)
  { 
    x = random(20, 67);
    y = random(25, 80);
     
    if ((x<=30 && x>=60 && y>=62 && y<=40) || (y>=60 && y<=40) || (x<=30 && x>=60 && y>=42 && y<=60))
    { x = random(3, 87);
      y = random(10, 80);
    }
    
    theOrn[i] = new ornaments(x, y, 10); 
  }
}


void draw()
{ 
  
  
  //set to scene number
  //if(time=7)
  //{
    
    
  //background
  background(#7CA6B2);
  pushMatrix();
    translate(0,0);
    
    fill(#093E4D);
    rect(0,500,700,300);
    
    //string
    stroke(0);
    line(355,110,414,60);
    line(415,60,480,110);
    noStroke();
    fill(100);
    ellipse(415,61,4,4);
    //painting
    fill(255);
    rect(355,105,120,120);
    image(out,355,105);
    //frame
    stroke(100,100,100);
    strokeWeight(20);
    noFill();
    rect(350,100,130,130);
    
    //couch
    fill(#790623);
    //back
    stroke(#500719);
    strokeWeight(2);
    ellipse(542,420,310,140);
    fill(#790623+40);
    ellipse(500,420,10,10);
    ellipse(580,420,10,10);
    ellipse(450,400,10,10);
    ellipse(630,400,10,10);
  
    //seat
    fill(#790623);
    rect(390,460,150,30);
    rect(420,460,120,30);
    rect(540,460,150,30);
    rect(540,460,120,30);
    rect(390,490,300,60);
    noStroke();
    rect(391,460,29,32);
    rect(661,460,29,32);
    stroke(#500719);
    ellipse(400,450,60,60);
    ellipse(680,450,60,60);
  
    pushMatrix();
      translate(40,150);
      scale(4, 4);
      //tree
      noStroke();
      smooth();
      fill(100);
      rect(20,100,50,10);
      fill(#7E3C12);
      quad(28, 100, 62, 100, 53, 70, 38, 70);
      fill(#0F932C);
      triangle(3, 80, 87, 80, 45, 50);
      triangle(10, 62, 80, 62, 45, 30);
      triangle(20, 42, 70, 42, 45, 10);
  
      strokeWeight(1);
      stroke(#B97070-50);
      fill(#B97070);
      rect(10,90,10,20);
      stroke(#A897ED-50);
      fill(#A897ED);
      rect(30,105,15,10);
      stroke(#12B42E+40);
      fill(#12B42E);
      rect(60,95,20,20);
      stroke(#97E9ED-50);
      fill(#97E9ED);
      rect(43,95,9,25);
      noStroke();
  
  
      for (int i=0; i<number; i++)
      { theOrn[i].run();  }
    popMatrix();
  popMatrix();
  
  
  
 // }
}





//send to next scene
void mousePressed()
{
  if(mouseX<700 || mouseX>0 && mouseY>0)
  { time=8;  }
}

//ornaments
class ornaments
{ 
  color c;
  int rad;
  float cx,cy,t;
  int clicks;
  boolean rise;

  ornaments(float x, float y, int radi)
  { 
    c = color(random(100, 255), random(100, 255), random(100, 255));
    cx=x;
    cy=y;
    rad=radi;
    t=random(0, 9);
    clicks=0;
    rise=false;
  }

  void draw()
  { 
    fill(c);
    ellipse(cx, cy, rad, rad);
  }

  void updateO()
  { 
    if (t<=0)
    { 
      rise=true;
    }
    if (t>=10)
    { 
      rise=false;
    }

    if (rise)
    { 
      c+=10;
      t++;
    }
    if (!rise)
    { 
      c-=10;
      t--;
    }
  }
  void run()
  { 
    updateO();
    draw();
  }
}

