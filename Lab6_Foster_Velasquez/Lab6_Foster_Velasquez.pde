//Lab 6 Foster and Velasquez


float cx1,cy1,cx2,cy2; //pupil coor
float ex1,ey1,ex2,ey2;  //eye coor
float t,r,rd;  //spinning stuff
float nx,ny,NoseRad;  //nose stuff
boolean spinEyes;


void setup()
{
size(400,400);
smooth();
stroke(0);
cx1 = 147;
cx2 = 253;
cy1 = cy2 = 150;
ex1 = 147;
ex2 = 253;
ey1 = ey2 = 150;
nx = ny = 200;
NoseRad = 50;
r = 100;
t=.5;
rd = 29;
spinEyes=false;

}

void spinEyes()
{
  
  t = t+.5;
  cx1 = ex1+rd*cos(t);
  cy1 = ey1+rd*sin(t);
  cx2 = ex2+rd*cos(t);
  cy2 = ey2+rd*sin(t);
}

void draw ()
{  

background(250);  
  
frameRate(15);
  
fill(#FBFF21);  //face
ellipse(200,200, 300,300);

arc(200,250,180,100,0,PI);  //smile

fill(255);  //eyes
ellipse(ex1,ey1,r,r);
ellipse(ex2,ey2,r,r);

fill(#4FA054);  //pupils
ellipse(cx1,cy1,40,40);
ellipse(cx2,cy2,40,40);

fill(#0030EA);  //nose
ellipse(nx,ny,NoseRad,NoseRad);

if(spinEyes == true)
{
  spinEyes();
}

}


void mouseDragged()
{
  
PVector v1, v2; 
v1 = new PVector (mouseX - cx1, mouseY - cy1);

v1.normalize();
v1.mult(29);

cx1 = v1.x + 147;
cy1 = v1.y + 150;
  
v2 = new PVector (mouseX - cx2, mouseY - cy2);

v2.normalize();
v2.mult(29);

cx2 = v2.x + 253;
cy2 = v2.y + 150;

}

void mousePressed()
 {
   
    PVector v1 = new PVector (mouseX - cx1, mouseY - cy1);

    v1.normalize();
    v1.mult(29);

    cx1 = v1.x + 147;
    cy1 = v1.y + 150;
  
    PVector v2 = new PVector (mouseX - cx2, mouseY - cy2);

    v2.normalize();
    v2.mult(29);

    cx2 = v2.x + 253;
    cy2 = v2.y + 150;
   
      if(( (mouseX - nx)*(mouseX - nx) + (mouseY - ny)*(mouseY - ny) - NoseRad*NoseRad/4 )<=0)  //<--Should be nose!! 
        {                                                                                     
     spinEyes = true; //This statement should be how the eyes rotate.
        }
       
       else
       {
       
         spinEyes=false;
      
       }
     
 }

