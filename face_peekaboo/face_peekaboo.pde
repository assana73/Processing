int faceH;
boolean drawOn;

void drawFace()
{  strokeWeight(1);
  fill(255,230,5);
  ellipse(50,50,100,100);
  fill(11,44,7);
  ellipse(25,35,30,30);
  ellipse(75,35,30,30);
  fill(255);
  ellipse(50,75,50,10);
}

void setup()
{
  size(400,400);
  faceH=300;
  drawOn=false;
}

void draw()
{
  background(255);
  
  frameRate(10);
  
  if(drawOn)
  {
    pushMatrix();
      translate(150,faceH);
      drawFace();
    popMatrix();
    faceH=faceH-5;
  }
  
  fill(#67320F);
  stroke(0);
  strokeWeight(3);
  rect(100,300,200,200);
  
  if(faceH<-150)
    {faceH=300;}
}

void mousePressed()
{  if(mouseX>100&&mouseX<300&&mouseY>300)
     {if (drawOn)
       {drawOn=false;
        faceH=300;
       }
      else
      {drawOn=true;}
     }
}
