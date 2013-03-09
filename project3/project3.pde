//Siobhan Foster
PImage self, innis, mia, kef1, kef2, out1, out2, out3, out4;
int loc,loc2,loc3,loc4,clicks,t;
int ellr=40;
final int NUM_ELL=30;
color inn;
float ellx[]=new float[NUM_ELL];
float elly[]=new float[NUM_ELL];
color pix;
boolean mouseOn, rise;

void setup()
{ 
  boolean filled = false;
  mouseOn = rise =false; 
  clicks=t=0;
  
  frameRate(2);
  size(400,400);
  background(255);
  
  //prep images
  self=loadImage("self.jpg");
  innis=loadImage("Innis.jpg");
  kef1=loadImage("dissidia_artwork_kefka.jpg");
  kef2=loadImage("kefka.gif");
  
  out1=createImage(self.width,self.height,RGB);
  out2=createImage(kef1.width,kef1.height,RGB);
  out3=createImage(kef2.width,kef2.height,RGB);
  out4=createImage(innis.width,innis.height,RGB);
  
  self.loadPixels();
  innis.loadPixels();
  kef1.loadPixels();
  kef2.loadPixels();
  out1.loadPixels();
  out2.loadPixels();
  out3.loadPixels();
  out4.loadPixels();
  
  //set placement of ellipses
  for(int i=0;i<NUM_ELL;i++)
  { ellx[i]=random(width);
    elly[i]=random(height);
  }
  
  //kefka set up
  for(int y=0;y<kef1.height;y++)
  { for(int x=0;x<kef1.width;x++)
    { loc=x+y*kef1.width;
      filled = false;
      for(int i=0;i<NUM_ELL;i++)
      { if(((x-ellx[i])*(x-ellx[i])+(y-elly[i])*(y-elly[i])-ellr*ellr)<=0)
        { out2.pixels[loc]=kef1.pixels[loc];  
          filled = true;}
        
      }
      if (!filled) { out2.pixels[loc]=color(255); }
    } 
  }
  
  for(int y=0;y<kef2.height;y++)
  { for(int x=0;x<kef2.width;x++)
    { loc3=x+y*kef2.width; 
      out3.pixels[loc3]=kef2.pixels[loc3];
    }
  }
  
  //code to make self image
  for(int y=0;y<self.height;y++)
  { for(int x=0;x<self.width;x++)
    { loc2=x+y*self.width;
      out1.pixels[loc2]=self.pixels[loc2];
    } 
  }
  
  //innis set up
  
  for(int y=0;y<innis.height;y++)
  { for(int x=0;x<innis.width;x++)
    { loc4=x+y*innis.width; 
      out4.pixels[loc4]=innis.pixels[loc4];
    }
  }
      
}

void drawKefka()
{ image(out2,10,0);
  if(mouseOn)
  { for(int i=0;i<NUM_ELL;i++)
    { if(((mouseX-ellx[i])*(mouseX-ellx[i])+(mouseY-elly[i])*(mouseY-elly[i])-ellr*ellr)<=0)
      {image(out3,ellx[i],elly[i]); }
    }
  }
}

void drawSelf()
{ if(mouseOn)
  { scale(.5,.5);
    image(out1,220,500+clicks*10);

    if(!rise)
    { clicks++; }

    if(rise)
    { clicks--; }
    
    if(500+clicks*10==900)
    { rise=true; }

    if(clicks==0)
    { rise=false;}    
  }
}

void drawInnis()
{ image(out4,50,50);
  if(mouseOn)
  { for(int y=0;y<innis.height;y++)
    { for(int x=0;x<innis.width;x++)
      { inn=innis.pixels[loc4];
        if(brightness(inn)<200 || brightness(inn)>240)
        { out4.pixels[loc4]=self.pixels[loc4]; }
      }
    }
  }
}

void draw()
{
   drawKefka();
   drawSelf();
   drawInnis();
}

void mousePressed()
{ if(mouseX<400 && mouseY<400)
  { if(!mouseOn)
    {mouseOn=true; }
    else
    {mouseOn=false;}
  }
}
