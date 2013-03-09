//Project 4 - Irene Jiang, Andrew Lau, Anna Velasquez


void setup()
{
  size(700, 700);
  //colorMode(RGB, 0, 255, 255, 100);
  noStroke();
  frameRate(30);
}
float x = -60;
float y = 50;
int j = 0;
int cx=0;
int cy=0;
int t=0;
int r=0;
int clicks=0;
boolean rise;
boolean run=true;


//scene change variable
int time=1;



void draw() 
{
  if(time==1)
  {
  background(110, 170, 232);

  fill(#1B2F7E, j);
  rect(0, 0, 700, 700);

  pushMatrix();
  translate(200, 300);
  scale(3, 3);
  //tree
  noStroke();
  smooth();
  fill(#7E3C12);
  quad(28, 100, 62, 100, 53, 70, 38, 70);
  fill(#0F932C);
  triangle(3, 80, 87, 80, 45, 50);
  triangle(10, 62, 80, 62, 45, 30);
  triangle(20, 42, 70, 42, 45, 10);
  popMatrix();

  pushMatrix();
  translate(100, 300);
  scale(1, 3);
  //tree
  noStroke();
  smooth();
  fill(#7E3C12);
  quad(28, 100, 62, 100, 53, 70, 38, 70);
  fill(#0F932C);
  triangle(3, 80, 87, 80, 45, 50);
  triangle(10, 62, 80, 62, 45, 30);
  triangle(20, 42, 70, 42, 45, 10);
  popMatrix();

  pushMatrix();
  translate(-100, 300);
  scale(2, 3);
  //tree
  noStroke();
  smooth();
  fill(#7E3C12);
  quad(28, 100, 62, 100, 53, 70, 38, 70);
  fill(#0F932C);
  triangle(3, 80, 87, 80, 45, 50);
  triangle(10, 62, 80, 62, 45, 30);
  triangle(20, 42, 70, 42, 45, 10);
  popMatrix();

  //draw destination
  fill(#FAE73A, 100);
  ellipse(500, 350, 60, 75);
  fill(#FAE73A, 150);
  ellipse(500, 350, 50, 65);
  fill(150, 150, 150);
  rect(width*.8+15, height/2, -30, -5);
  fill(100, 100, 100);
  rect (width*.8+10, height/2, -20, -10);
  fill(50, 50, 50);
  rect(width*.8+5, height/2, -10, -20);

  noStroke();
  fill(140, 196, 125);
  rect(0, 600, 700, 100);
  fill(164, 190, 206);
  rect(0, 620, 550, 30);


  //house
  pushMatrix();
  translate(0, -100);
  scale(1.5, 1.5);
  pushMatrix();
  //stairs
  noStroke();
  fill(#232323);
  rect(275, 500, 10, -15);
  rect(285, 500, 10, -25);
  rect(295, 500, 10, -35);
  rect(305, 500, 10, -45);
  rect(315, 500, 10, -55);
  rect(325, 500, 10, -65);
  //building
  fill(#A11309);
  rect(325, 305, 200, 200);
  //smog
  fill(#CACACA);
  ellipse(410, 185, 40, 40);
  ellipse(395, 160, 55, 55);
  ellipse(430, 90, 20, 20);
  //Chimney
  fill(#671B0B);
  rect(400, 265, 30, -60);
  rect(395, 200, 40, 10);
  //roof
  fill(#7E3911);
  triangle(320, 305, 500, 305, 500, 200);
  //window
  rect(370, 330, 70, 70);
  fill(#FFDA76);
  rect(375, 335, 60, 60);
  stroke(#7E3911);
  strokeWeight(5);
  line(375, 365, 435, 365);
  line(405, 335, 405, 395);
  popMatrix();
  popMatrix();

  pushMatrix();
  translate(0+cx, 340-cy);
  scale(.6, .6);
  girl();
  popMatrix();

  pushMatrix();
  translate(0, -95);
  scale(1.5, 1.5);
  //Fence
  stroke(255);
  strokeWeight(7);
  for (int i = 265; i <500; i+=20) 
  { 
    line(i, 425, i, 500);
  }

  fill(255);
  noStroke();
  rect(265, 440, 250, 5);
  rect(265, 480, 250, 7);

  noStroke(); 
  fill(110, 170, 232);
  quad(0, 0, 235, 0, 222, 95, 0, 103);
  rect(480, 0, 20, 46);
  fill(#1B2F7E, j);
  quad(0, 0, 235, 0, 222, 95, 0, 103);
  rect(480, 0, 20, 46);
  popMatrix();

  pushMatrix();
  translate(500, 420);
  scale(3, 3);
  //tree
  noStroke();
  smooth();
  fill(#7E3C12);
  quad(28, 100, 62, 100, 53, 70, 38, 70);
  fill(#0F932C);
  triangle(3, 80, 87, 80, 45, 50);
  triangle(10, 62, 80, 62, 45, 30);
  triangle(20, 42, 70, 42, 45, 10);
  popMatrix();

  pushMatrix();
  translate(0, 500);
  scale(3, 3);
  //tree
  noStroke();
  smooth();
  fill(#7E3C12);
  quad(28, 100, 62, 100, 53, 70, 38, 70);
  fill(#0F932C);
  triangle(3, 80, 87, 80, 45, 50);
  triangle(10, 62, 80, 62, 45, 30);
  triangle(20, 42, 70, 42, 45, 10);
  popMatrix();

  cloud();
  }
}



//switch to next scene
void mousePressed()
{
  if(mouseX<700 || mouseX>0 && mouseY>0)
  { time=2;  }
}

void cloud() 
{
    pushMatrix();
      translate(-t, 0);
      noStroke();
      fill(250);
      ellipse(227, 54, 75, 60);
      ellipse(131, 92, 50, 50);
      ellipse(168, 70, 70, 70);
  
      ellipse(827, 54, 75, 60);
      ellipse(731, 92, 50, 50);
      ellipse(768, 70, 70, 70);
  
      ellipse(1427, 54, 75, 60);
      ellipse(1331, 92, 50, 50);
      ellipse(1368, 70, 70, 70);
  
      ellipse(167, 224, 75, 60);
      ellipse(81, 202, 30, 50);
      ellipse(118, 190, 70, 60);
  
      ellipse(767, 224, 75, 60);
      ellipse(681, 202, 30, 50);
      ellipse(718, 190, 70, 60);
  
      ellipse(1367, 224, 75, 60);
      ellipse(1281, 202, 30, 50);
      ellipse(1318, 190, 70, 60);

      ellipse(40, 43, 60, 60);
      ellipse(0, 20, 100, 50);

      ellipse(640, 43, 60, 60);
      ellipse(600, 20, 100, 50);
      
      ellipse(1240, 43, 60, 60);
      ellipse(1200, 20, 100, 50);

      //big clouds
      ellipse(280, 7, 100, 100);
      ellipse(380, 28, 200, 200);
      ellipse(470, 85, 100, 100);
      ellipse(310, 71, 100, 75);

      ellipse(880, 7, 100, 100);
      ellipse(980, 28, 200, 200);
      ellipse(1070, 85, 100, 100);
      ellipse(910, 71, 100, 75);
    popMatrix();
    
    if(t==600)
    { t=0; }
    t+=1;
} 


void girl() 
{
  pushMatrix();
  noStroke();
  translate(x, y);

  //legR
  pushMatrix();
  translate(160, 382);
  rotate(PI*r/24);
  fill(240, 217, 194);
  triangle(0, 0, 9, 54, 13, 0);
  popMatrix();

  //legL
  pushMatrix();
  translate(147, 381);
  rotate(-PI*r/24);
  fill(240, 217, 194);
  triangle(0, 0, 2, 58, 14, 2);
  popMatrix();

  fill(0);
  beginShape();
  vertex(126, 248);
  vertex(113, 311);
  vertex(182, 317);
  vertex(182, 240);
  endShape(CLOSE);
  noFill();

  //handR
  pushMatrix();
    translate(170, 295);
    rotate(PI*r/16);
    fill(240, 217, 194);
    ellipse(15, 54, 20, 20);
    fill(183, 40, 15);
    beginShape();
      vertex(0, 0);
      vertex(26, 52);
      vertex(4, 60);
      vertex(-10, 15);
    endShape(CLOSE);
  popMatrix();

  //face
  fill(240, 217, 194);
  ellipse(153, 250, 55, 75);

  //cheeks

  fill(242, 64, 64);
  ellipse(144, 273, 10, 5);
  ellipse(168, 273, 10, 5);

  //eyes
  fill(0);
  ellipse(146, 263, 10, 13);
  ellipse(169, 263, 10, 13);

  pushMatrix();
  triangle(150, 229, 188, 264, 185, 245);
  triangle(149, 239, 124, 236, 120, 279);

  //hat
  translate(308, 460);
  rotate(radians(180));
  fill(183, 40, 15);
  arc(155, 214, 65, 75, 0, PI);
  popMatrix();

  //dress
  fill(183, 40, 15);
  beginShape();
  vertex(148, 290);
  vertex(116, 392);
  vertex(190, 392);
  vertex(160, 290);
  endShape(CLOSE);

  //buttons
  fill(103, 43, 16);
  ellipse(159, 316, 10, 10);
  ellipse(160, 341, 10, 10);
  ellipse(159, 367, 10, 10);

  //handL
  pushMatrix();
    translate(155, 290);
    rotate(-PI*r/16);
    fill(240, 217, 194);
    ellipse(-30, 60, 20, 20);
    fill(183, 40, 15);
    beginShape();
      vertex(0, 0);
      vertex(-10, 0);
      vertex(-39, 56);
      vertex(-18, 64);
    endShape(CLOSE);
  popMatrix();

  //scarf 
  fill(211, 89, 32);
  beginShape();
  vertex(131, 277);
  vertex(175, 276);
  vertex(169, 293);
  vertex(137, 293);
  endShape(CLOSE);

  beginShape();
  vertex(168, 292);
  vertex(199, 307);
  vertex(183, 318);
  vertex(168, 294);
  endShape(CLOSE);

  beginShape();
  vertex(168, 293);
  vertex(179, 311);
  vertex(169, 319);
  vertex(160, 293);
  endShape(CLOSE);
  noFill();
  popMatrix();
  
  if(cx<=350)
  { if(rise)
    { r++; }
    if(!rise)
    { r--; }
    cx+=5;
  }
  
  if(cx>350 && cx<410)
  { if(rise)
    { r++; }
    if(!rise)
    { r--; }
    cx+=2;
    cy+=2;
  }
  
  if(cx>=410)
  { run=false; }
    
  if(run)
  { if(r<=0)
    { rise=true; }
    if(r>=6)
    { rise=false; }
  }
}


int frame;


