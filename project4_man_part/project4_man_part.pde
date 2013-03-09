//man running

//make man
class man
{ 
  PImage manStill, manRun1, manRun2, manRun3, manRun4, out1, out2, out3, out4, out5;
  int loc1, loc2, loc3, loc4, loc5,locb;
  color pix1, pix2, pix3, pix4, pix5,pixb;
  PVector run;
  boolean collide;
  boolean rise = false;
  float cx, cy;
  int living, nextScene;

  //setup variables
  man(PVector there, int h, int g, int live)
  { 
    run = there.get();
    cx=h;
    cy=g;
    living=live;
    color blank= color(100, 100, 100);
    //all images
    manStill=loadImage("man_still.png");
    manRun1=loadImage("man_forward.png");
    manRun2=loadImage("man_forward2.png");
    manRun3=loadImage("man_back.png");
    manRun4=loadImage("man_back2.png");

    out1=createImage(manStill.width, manStill.height, RGB);
    out2=createImage(manRun1.width, manRun1.height, RGB);
    out3=createImage(manRun2.width, manRun2.height, RGB);
    out4=createImage(manRun3.width, manRun3.height, RGB);
    out5=createImage(manRun4.width, manRun4.height, RGB);

    manStill.loadPixels();
    manRun1.loadPixels();
    manRun2.loadPixels();
    manRun3.loadPixels();
    manRun4.loadPixels();

    out1.loadPixels();
    out2.loadPixels();
    out3.loadPixels();
    out4.loadPixels();
    out5.loadPixels();

    //make white parts transparent
    for (int y=0;y<manStill.height;y++)
    { 
      for (int x=0;x<manStill.width;x++)
      { 
        loc1=x+y*manStill.width;
        pix1=manStill.pixels[loc1];
        if (brightness(pix1)!=255)
        { 
          out1.pixels[loc1]=manStill.pixels[loc1];
        }
        else
        { 
          out1.pixels[loc1]=blank;
        }
      }
    }

    for (int y=0;y<manRun1.height;y++)
    { 
      for (int x=0;x<manRun1.width;x++)
      { 
        loc2=x+y*manRun1.width;
        pix2=manRun1.pixels[loc2];
        if (brightness(pix2)!=255)
        { 
          out2.pixels[loc2]=manRun1.pixels[loc2];
        }
        else
        { 
          out2.pixels[loc2]=blank;
        }
      }
    }

    for (int y=0;y<manRun2.height;y++)
    { 
      for (int x=0;x<manRun2.width;x++)
      { 
        loc3=x+y*manRun2.width;
        pix3=manRun2.pixels[loc3];
        if (brightness(pix2)!=255)
        { 
          out3.pixels[loc3]=manRun2.pixels[loc3];
        }
        else
        { 
          out3.pixels[loc3]=blank;
        }
      }
    }    
    for (int y=0;y<manRun3.height;y++)
    { 
      for (int x=0;x<manRun3.width;x++)
      { 
        loc4=x+y*manRun3.width;
        pix4=manRun3.pixels[loc4];
        if (brightness(pix4)!=255)
        { 
          out4.pixels[loc4]=manRun3.pixels[loc4];
        }
        else
        { 
          out4.pixels[loc4]=blank;
        }
      }
    }    
    for (int y=0;y<manRun4.height;y++)
    { 
      for (int x=0;x<manRun4.width;x++)
      { 
        loc5=x+y*manRun4.width;
        pix5=manRun4.pixels[loc5];
        if (brightness(pix5)!=255)
        { 
          out5.pixels[loc5]=manRun4.pixels[loc5];
        }
        else
        { 
          out5.pixels[loc5]=blank;
        }
      }
    }
  }

  void flow()
  {
    cx= cx + run.x;
    cy= cy + run.y;

    //toggle b/w images 
    if (living==1)
    { 
      rise=true;
    }

    if(living==5)
    {
      rise=false;
    }
    
    if (!rise)
    { 
      living--;
    }
    else
    { 
      living++;
    }

    pushMatrix();
    translate(cx, cy);
    //select directional facing of images

    if (run.x>0)
    { 
      if (living/2==0 || living/5==0)
      { 
        image(out3, 0, 0);
      }
      else
      { 
        image(out2, 0, 0);
      }
    }
    else
    { 
      image(out1, 0, 0);
    }
    popMatrix();
  }
  
  int next()
  {
    if(cx=800)
    { nextScene=1;
      return nextScene;
    }
    else
    { nextScene=0;
      return nextScene;
    }
  }
  
  
}

Explosion ex[] = new Explosion[5];
int t =0;
Meteor m[];
//declare a Rain system
PSys fireW1;
man d;
int frame;

void setup(){
  size(800, 500);
  smooth();
  frameRate(40);
  d = new man(new PVector(1, 0), 30, 281, 1);
  m = new Meteor[5];
  for(int i =0; i<5; i++){
    m[i] = new Meteor(new PVector(random(0,width),0,0),new PVector(random(0,width),random(2*height/3,height),0),(i+1)*80);
    ex[i] = new Explosion(m[i].mLand);
  }
  fireW1 = new PSys(1000, new PVector(width/2, -500));
}

void draw(){
  
  background(#3C9DF0);
  fill(#6C5700);
  rect(0, 2*height/3, width, height/3);
  
  d.flow();
  fireW1.run();
  
  for(int i =0; i<5; i++){
    m[i].draw(t);
    m[i].fall(t);
    if(!m[i].isAlive){
       ex[i].run();
    }
  }
  t++;
  
  
  
  // put conditional for change in shape here
  //when nextScene (checked by d.next()) is 1, change to cliff scene and have dragon form
  //all dragon form images included in project folder.
  
  
  
}

class Meteor{
  PVector begin, mLand,vel, loc;
  float distance;
  int startDelay;
  boolean isAlive;
  Meteor(PVector start, PVector end, int dlay){
    begin = start.get();
    loc = start.get();
    mLand = end.get();
    end.sub(start);
    vel = end.get();
    distance = vel.mag();
    vel.normalize();
    isAlive = true;
    
    startDelay = dlay;
  }

  void draw(int t){
    float eta;
    PVector temp;
  
    temp = new PVector(mLand.x, mLand.y);
    temp.sub(loc);
    eta = temp.mag();
    if(startDelay<t){
      if(isAlive){
       fill(0,109,209);
       pushMatrix();
          translate(loc.x,loc.y);
          scale(eta/distance*3);
          ellipse(0,0,30,30);
       popMatrix();
      }
    }
 }
  
  void fall(int t){
    float more;
    PVector temp;
    
    temp = new PVector(begin.x, begin.y);
    temp.sub(loc);
    more = temp.mag();
    if(startDelay<t){
      if(more<distance){
       loc.x += vel.x*5;
       loc.y += vel.y*5;  
      }else{
        isAlive = false;
      }
    }
  }
  
  
  
  
  
  
  
}
class ExplosionParticle{
  PVector loc, mLand,vel,accel;
  boolean isAlive;
  
  ExplosionParticle(PVector start){
     isAlive = true;
     loc = start.get();
     mLand = start.get();
     accel = new PVector(0,.4,0);
     vel = new PVector(random(-5,5),random(-10,0),0);
  }
  
  void run(){
     updateExplosion();
     drawExplosion();
  }
  
  void updateExplosion(){
    vel.add(accel);
    loc.add(vel);
    if(loc.y > mLand.y){
      isAlive = false; 
    }
  }
  
  void drawExplosion(){
     pushMatrix();
       fill(0,102,209);
       stroke(0,102,209);
       translate(loc.x,loc.y);
       ellipse(0,0,5,5);
    popMatrix();
  }
}

class Explosion{
  ArrayList particles;
  PVector source;
  
  Explosion(PVector start){
    source = start.get();
    particles = new ArrayList();
    for(int i =0; i < 20; i++){
       particles.add(new ExplosionParticle(source));
    }
  }
  
  void run(){
    for(int i = particles.size()-1; i >=0; i--){
      ExplosionParticle p = (ExplosionParticle)particles.get(i);
      p.run();
      if(!p.isAlive){
        particles.remove(i); 
      }
    } 
  } 
}

class Rain {
  
  PVector loc;
  PVector vel;
  PVector accel;
  float life;
  PVector pcolor;
  
  //constructor
  Rain(PVector start) {
    accel = new PVector(0, 0.05, 0); //gravity
    vel = new PVector(random(-2, 2), random(-6, 0), 0);
    pcolor = new PVector(80, 20, 150);
    loc = start.get();
    life = 100000;
    
  }
  
  
  //what to do each frame
  void run() {
    updateP();
    renderP();
  }
  
  //a function to update the Rain each frame
  void updateP() {
    vel.add(accel);
    loc.add(vel);
    life -= 1.0;
    if(loc.y >= height) {
      loc.y = -100;
      accel = new PVector(0, 0.05, 0); //gravity
      vel = new PVector(random(-2, 2), random(-6, 0), 0);
    }
  }
  
  //how to draw a Rain
  void renderP() {
    pushMatrix();
      ellipseMode(CENTER);
      stroke(pcolor.x, pcolor.y, pcolor.z);
      fill(pcolor.x-10*life, pcolor.y-10*life, pcolor.z-10*life);
      translate(loc.x, loc.y);
      ellipse(0, 0, 2, 4);
    popMatrix();
  }
  
  //a function to test if a Rain is alive
  boolean alive() {
    if (life <= 0.0) {
      return false;
    } else {
      return true;
    }
  }
} //end of Rain object definition


//now define a group of Rains as a RainSys
class PSys{
  
  ArrayList drops; //all the drops
  PVector source; //where all the Rains emit from
  PVector shade; //their main color
  
  //constructor
  PSys(int num, PVector init_loc) {
    drops = new ArrayList();
    source = init_loc.get();
    shade = new PVector(random(255), random(255), random(255));
    for (int i=0; i < num; i++) {
      drops.add(new Rain(source));
    }
  }
    
    //what to do each frame
    void run() {
      //go through backwards for deletes
      for (int i=drops.size()-1; i >=0; i--) {
        Rain p = (Rain) drops.get(i);
        //update each Rain per frame
        p.run();
        if ( !p.alive()) {
          drops.remove(i);
        }
      }
    }
    
    //is Rain system still populated?
    boolean dead() {
        if (drops.isEmpty() ) {
          return true;
        } else {
          return false;
        }
    }
}

