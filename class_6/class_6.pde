//Siobhan Foster and Anna Velasquez

void setup()
{  size(400,400);
   frameRate(5);
   smooth();
   noStroke();
}

void draw()
{
  myFunc(95,65,0);
  myFunc(240,345,PI);
}

void myFunc(int x,int y,float rad)
{
  float r2,g,b;
  float r,cx,cy,centerx,centery,Pscale,t;
  
  Pscale=30;
  r=200;
  centerx=centery=130;
  t=0;
  pushMatrix();
    translate(x,y);
    rotate(rad);
    r2=random(255);
    g=random(255);
    b=random(255);
    for(int i=0;i<=80;i++)
    { fill(r,g,b);
      t=t+.25;
      cx=centerx+r*cos(t);
      cy=centery+r*sin(t);
      ellipse(cx,cy,Pscale,Pscale);
      r-=5;
      r2-=2;
      g-=2;
      b-=2;
    }
  popMatrix();
  
}

save("foster_velasquez.jpg");
