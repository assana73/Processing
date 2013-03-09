float radiusA,radiusB,cx,cy;

size(708,268);
background(250,186,10);
smooth();
noStroke();

cx=10;
cy=134;
radiusA=10;

fill(20,30,230);
ellipse(cx,cy,radiusA,radiusA);

for(int i=0;i<7;i++)
{
  radiusB=1.6*radiusA;
  cx=cx+radiusA/2+radiusB/2-1;
  ellipse(cx,cy,radiusB,radiusB);
  radiusA=radiusB;
}
