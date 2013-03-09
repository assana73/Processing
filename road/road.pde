//CSC 123 Lab 11 base code for one point perspective exercize and class practice.
//by ZJ Wood

//TODO: add code such that when the mouse is clicked the cars and ships restart - do not 'new' variables, just 
//      reset variables are desired

//TODO: change the code so that the cars do not run over one another (you may use a 'hack', ie have them
//      start at different times or a more complex method)

class dragon 
{
 PVector loc,begin,stop,fall;
 PVector dir;
 float speed;
 float dist;
 int go;
 color c;
 boolean alive;

 dragon(PVector start, PVector end, PVector drop)
 {
   begin =start.get();
   loc = start.get();
   stop = end.get();
   end.sub(start);
   dir = end.get();
  dist = dir.mag();
   dir.normalize();
   fall= drop.get();

   speed = random(1, 2);
   c = color(random(20, 240), random(10, 240), random(10, 240));
   alive = true;
 }

 void draw() 
 {
   float more;
   PVector temp;

   temp = new PVector(stop.x, stop.y);
   temp.sub(loc);
   more = temp.mag();
   if (alive) 
   {
     fill(c);
     pushMatrix();
       translate(loc.x, loc.y);
       scale( (more/dist)*1.6 );
       fill(c-40);
       quad(-10,-5,-10,0,-25,5,-70,-5);
       fill(c-20);
       triangle(-40,-10,-10,5,-15,-3);
       fill(c);
       ellipse(0, 0, 40, 13);
       fill(c-40);
       quad(0,-3,0,0,45,5,90,-5);
     popMatrix();
   }
 }

 void fly() 
 {
   float more;
   PVector temp;

   temp = new PVector(begin.x, begin.y);
   temp.sub(loc);
   temp.sub(fall);
   more = temp.mag();
   if (more < dist) 
   {
     loc.x += dir.x*speed;
     loc.y += dir.y*speed;
   } 
   else
   { alive = false; }
 }
 
}

class car 
{
  PVector loc, stop, begin;
  PVector dir;
  float speed;
  float dist;
  color c;
  boolean alive;

  car(PVector start, PVector end) 
  {
    begin = start.get();
    loc = start.get();
    stop = end.get();
    end.sub(start);
    dir = end.get();
    dist = dir.mag();
    dir.normalize();
    speed = random(1, 2);
    c = color(random(20, 240), random(10, 240), random(10, 240));
    alive = true;
  }

  void draw() {
    float more;
    PVector temp;

    temp = new PVector(stop.x, stop.y);
    temp.sub(loc);
    more = temp.mag();
    if (alive) {
      pushMatrix();
      translate(loc.x, loc.y);
      scale( (more/dist)*1.6 );
      noStroke();
      fill(30);
      ellipse(32, 20, 13, 13);
      ellipse(12, 22, 15, 15);
      fill(c);
      rect(0, 0, 40, 20);
      fill(c-60);
      arc(35, 0, 50, 30, PI, PI*2 + PI/6);
      fill(c);
        pushMatrix();
        rotate(-PI/8);
        rect(25, 18, 40, 15);
        popMatrix();
      fill(30);
      ellipse(67, 11, 13, 13);
      ellipse(49, 18, 15, 15);
      popMatrix();
    }
  }

  void drive() {
    float more;
    PVector temp;

    temp = new PVector(begin.x, begin.y);
    temp.sub(loc);
    more = temp.mag();
    if (more < dist) {
      loc.x += dir.x*speed;
      loc.y += dir.y*speed;
    } 
    else {
      alive = false;
    }
  }
}

car theCars[];
dragon theNest[];
int numC;
int time[];

void setup() {

  frameRate(30);
  size(400, 400);
  smooth();
  numC = 5;

  theCars = new car[numC];
  theNest = new dragon[numC];
  time = new int[numC];
  
  for (int i=0; i < numC; i++) {
    theCars[i] = new car(new PVector(0, height), new PVector(width*.8, height/2));
    theNest[i] = new dragon(new PVector(0, height/4), new PVector(width*.8, height/3 + height/10), new PVector(random(-1,1),random(-1,1)));
    time[i] = i+20;
  }
}


void mousePressed()
{
  if(mouseX<400 && mouseY<400)
  { 
  for (int i=0; i < numC; i++) 
    {
      //cars  new PVector(0, height), new PVector(width*.8, height/2)
      theCars[i].draw();
      theCars[i].drive();
      //nest  new PVector(0, height/4), new PVector(width*.8, height/3 + height/10)
      theNest[i].draw();
      theNest[i].fly();
    }
  }
}

void draw() {
  background(175, 221, 245);
  noStroke();
  fill(130, 167, 214);
  ellipse(330, height/2, width/5, height/9);
  rect(345, height/4 +height/6, width/20, height/9);
  rect(300, height/4 +height/6, width/20, height/9);
  fill(90,115,147);
  ellipse(310,height/5 + height/4 + 12,width/30,height/30);
  ellipse(340,height/5 + height/4 + 12,width/30,height/30);
  //draw forground
  noStroke();
  fill(147, 107, 70);
  rect(0, height/2, width, height/2);
  //draw road
  fill(100);
  triangle(width*.8, height/2, width*.4, height+20, -.2*width, height+20);
  for (int t=0; t < 100; t++)
  { for(int i=0;i<numC;i++)
    { if(time[i]==t)
      {  theCars[i].draw();
         theCars[i].drive();
         theNest[i].draw();
         theNest[i].fly();
      }
    }
  }
}

