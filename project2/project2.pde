//Siobhan Foster
//an awesome,weird thing.
boolean increase,start,n;
int i;

void setup()
{
  size(450,450);
  background(40);
  increase=true;
  start=false;
  n=false;
  i=0;
  noStroke();
}

void draw()
{
  frameRate(40);
  if(start)
  {
    for(int d=0;d<9;d++)
    {
      if(increase)
      {
        pushMatrix();
          translate(20*i,20*d);
          myFunc();
        popMatrix();
        i++;
        println("d: "+d);
        println("i: "+i);
      }
      if(increase==false)
      {
        pushMatrix();
          translate(20*i,20*d);
          myFunc();
        popMatrix();
        i--;
        d--;
        println("i: "+i);
      }
      if(i==10)
      { increase=false;}
      if(i==0)
      { increase=true;}
    }
  //background
  fill(#312D29);
  rect(0,260,450,20);
  }
  save("project_2.jpg");
}

void myFunc()
{
  float r,cx,cy,centerx,centery,Pscale,t,def;
  r=30;
  centery=centerx=50;
  Pscale=30;
  t=0;
  def=random(255);
  for(int a=0; a<7;a++)
  { 
    fill(def);
    cx=centerx+r*cos(t);
    cy=centery+r*sin(t);
    ellipse(cx,cy,Pscale/2+Pscale/3,Pscale);
    t=t+.25;
    def-=15;
  }
  //vertical lines
  fill(#4B2414);
  rect(30,260,10,40);
  //horizontal lines
  fill(#13520B);
  rect(0,350,270,10);
  
}

void mousePressed()
{
  if(mouseX>=0&&mouseY>=0)
  {
    if(start==false)
    { start=true;
     // i=0;
    }
   else
   { start=false;
     i=0;
     increase=true;
   }
  }
}

