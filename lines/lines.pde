size(400,400);

float x0,y0,x1,y1;
float curX,curY,rad;
float r,g,b;

x0=y0=10;
x1=y1=390;
rad=10;

r=random(255);
g=random(255);
b=random(255);

//draw line
for(float t=0;t<1;t=t+.05)
{  noStroke();
   fill(r,g,b);
   curX=x0+t*(x1-x0);
   curY=y0+t*(y1-y0);
   ellipse(curX,curY,rad,rad);
   ellipse(400-curX,curY,rad,rad);
   r+=10;
   g+=10;
   b+=10;
   rad+=3;  }

