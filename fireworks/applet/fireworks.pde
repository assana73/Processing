//Siobhan Foster and Anna Velasquez

int circ1,circ2x,circ2y,circ3x,circ3y;
color c1,c2,c3;
boolean a;


void draw1()
{
  noStroke();
  fill(c1);
  ellipse(50,50,30,30);
}

void draw2()
{
  noStroke();
  fill(c2);
  ellipse(50,50,30,30);
}

void draw3()
{
  noStroke();
  fill(c3);
  ellipse(50,50,30,30);
}

void setup()
{
  smooth();
  
  size(400,400);
  circ1=300;
  circ2x=150;
  circ2y=300;
  circ3x=150;
  circ3y=300;
  a=false;
}

void draw()
{
  background(200);
  frameRate(10);
  if(a)
    {pushMatrix();
      translate(150,circ1);
      draw1();
     popMatrix();
     circ1-=5;
     pushMatrix();
       translate(circ2x,circ2y);
       draw2();
     popMatrix();
     circ2y-=5;
     if(circ2y<=180)
       {circ2x-=3;}
     pushMatrix();
       translate(circ3x,circ3y);
       draw3();
     popMatrix();
     circ3y-=5;
     if(circ3y<=180)
       {circ3x+=3;}
    }
  fill(#E50505);
  stroke(0);
  strokeWeight(1);
  rect(150,300,100,100);
  
  if (circ1<-50&&circ2y<-50&&circ3y<-50)
    { circ1=300;
      circ2x=150;
      circ2y=300;
      circ3x=150;
      circ3y=300;}
}

void mousePressed()
{  if(mouseX>150&&mouseX<250&&mouseY>300)
      {if(a)
        {a=false;
         circ1=300;
         circ2x=150;
         circ2y=300;
         circ3x=150;
         circ3y=300;
       }
       else
       {a=true;
       c1=color(random(150,255),random(150,255),random(150,255));
       c2=color(random(150,255),random(150,255),random(150,255));
       c3=color(random(150,255),random(150,255),random(150,255));
       }
      }
}

