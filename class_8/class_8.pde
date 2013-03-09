boolean draw;
PVector v1;
float t;

void drawFace()
{
  strokeWeight(1);
  fill(255,230,3);
  ellipse(50,50,100,100);
  fill(11,44,7);
  ellipse(25,35,30,30);
  ellipse(75,35,30,30);
  fill(255);
  ellipse(50,75,50,10);
}

void setup()
{size(400,400);
  draw=false;
  
  v1= new PVector(random(-1,1),random(-1,0));
  t=0;
}

void draw()
{
  background(255);
  if(draw)
  {
    pushMatrix();
      translate(130+t*v1.x,300+t*v1.y);
      drawFace();
    popMatrix();
    t+=5;
  }
  fill(#67320F);
  stroke(0);
  strokeWeight(3);
  rect(100,300,200,200);
}

void mousePressed()
{ if(mouseX>100&&mouseX<300&&mouseY>300)
  { draw=true;
    t=0;
    v1=new PVector(random(-1,1),random(-1,0));
  }
}
