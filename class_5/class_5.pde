

float cx,cy,cu;
//setup
void setup()
{
  size(400,400);
  smooth();
  
  cu= random(0,255);
  cx= random(0,width);
  cy= random(0,height);
}

//function that draws the scene
void draw()
{
  background(128);
  fill(cu);
  ellipse(cx,cy,20,20);
}

void mousePressed()
{
  cu= random(0,255);
  cx= mouseX;
  cy= mouseY;
}

void yellowEllipse()
{  fill(285,230,3);
ellipse(cx,cy,20,20);
}
