import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class simp_fireworks extends PApplet {

//Base particle code for CSC 123 lab 10


//define a particle
class Particle {
  
  PVector loc;
  PVector vel;
  PVector accel;
  float d;
  float life;
  PVector pcolor;
  
  //constructor
  Particle(PVector start) {
    accel = new PVector(0, 0.05f, 0); //gravity
    vel = new PVector(random(-2, 2), random(-6, 0), 0);
    pcolor = new PVector(random(255), random(255), random(255));
    loc = start.get();
    d = 8.0f;
    life = 250;
  }
  
  //TODO define another constructor that allows a particle to start with a given color
  Particle(PVector start, PVector startColor)
  { 
    accel = new PVector(0, 0.05f, 0); //gravity
    vel = new PVector(random(-2, 2), random(-6, 0), 0);
    pcolor = new PVector(startColor.x,startColor.y,startColor.z);
    loc = start.get();
    d = 8.0f;
    life = 250;
  }
  
  //what to do each frame
  public void run() {
    updateP();
    renderP();
  }
  
  //a function to update the particle each frame
  public void updateP() {
    vel.add(accel);
    loc.add(vel);
    life -= 1.0f;
    
  }
  
  //how to draw a particle
  public void renderP() {
    pushMatrix();
      ellipseMode(CENTER);
      stroke(pcolor.x-1,pcolor.y-1,pcolor.z-1);
      fill(pcolor.x+=vel.x,pcolor.y+=vel.y,pcolor.z);
      translate(loc.x, loc.y);
      ellipse(0, 0, d, d);
    popMatrix();
  }
  
  //a function to test if a particle is alive
  public boolean alive() 
  {
    if (life <= 0.0f) 
    { return false;  } 
    else 
    { return true;  }
  }
} //end of particle object definition


//now define a group of particles as a particleSys
class PSys{
  
  ArrayList particles; //all the particles
  PVector source; //where all the particles emit from
  PVector shade; //their main color
  
  
  //TODO: add a new particle constructor that will take in a starting color for a particle
  //constructor
    PSys(int num, PVector init_loc) 
    {
      particles = new ArrayList();
      source = init_loc.get();
      shade = new PVector(random(255), random(255), random(255));
      for (int i=0; i < num; i++) 
      {  particles.add(new Particle(source,shade));  }
    }
    
    //what to do each frame
    public void run() 
    {
      //go through backwards for deletes
      for (int i=particles.size()-1; i >=0; i--) 
      {
        Particle p = (Particle) particles.get(i);
        //update each particle per frame
        p.run();
        if ( !p.alive()) 
        {
          particles.remove(i);
        }
      }
    }
    
    //is particle system still populated?
    public boolean dead() {
        if (particles.isEmpty() ) 
        {  return true;  }
        else 
        {  return false; }
    }
}

//declare a particle system
PSys fireW1;
PSys fireW2;
PSys fireW3;
PSys fireW4;
PSys fireW5;

ArrayList fireworks;
int frame;

public void setup() {
  size(500, 500);
  colorMode(RGB, 255, 255, 255, 100);
  //start a new particle system
  
  fireworks = new ArrayList();  
  for(int i=0; i<5; i++)
  { fireworks.add(new PSys(100, new PVector(random(width-width/2), random(height-40), 0)));
  }
  fireW1 = new PSys(100, new PVector(random(width-width/2), random(height-40), 0));
  fireW2 = new PSys(100, new PVector(random(width-width/2), random(height-40), 0));
  fireW3 = new PSys(100, new PVector(random(width-width/2), random(height-40), 0));
  fireW4 = new PSys(100, new PVector(random(width-width/2), random(height-40), 0));
  fireW5 = new PSys(100, new PVector(random(width-width/2), random(height-40), 0));
  
  smooth();
  frame = 0;
  frameRate(40);
}

//TODO: add code so that the fire work explodes where the mouse clicks
public void mousePressed()
{  if(mouseX<500 && mouseY<500)
   { fireW1=new PSys(100, new PVector(mouseX, mouseY, 0)); 
     fireW2=new PSys(100, new PVector(mouseX + random(200), mouseY + random(200), 0));
     fireW3=new PSys(100, new PVector(mouseX - random(200), mouseY + random(200), 0));
     fireW4=new PSys(100, new PVector(mouseX - random(200), mouseY - random(200), 0));
     fireW5=new PSys(100, new PVector(mouseX + random(200), mouseY - random(200), 0));
   }
}
   
public void draw() {
  background(0);
  fireW5.run();
  fireW4.run();
  fireW3.run();
  fireW2.run();
  fireW1.run(); 
  }
  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "simp_fireworks" });
  }
}
