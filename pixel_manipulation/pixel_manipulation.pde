PImage img1,outImg;
int loc;
color pix;

void setup()
{ size(1000,600);
  background(0);
  img1=loadImage("5c4e776ff6773962.jpg");
  outImg=createImage(img1.width,img1.height,RGB);
  
  img1.loadPixels();
  outImg.loadPixels();
  
  for(int y=0;y<img1.height;y++)
  { for(int x=0;x<img1.width;x++)
    { loc=x+y*img1.width;
      pix=img1.pixels[loc];
      if(brightness(pix)<120||brightness(pix)>200)
      {
        outImg.pixels[loc]=img1.pixels[loc];
      }
    }
}}

void draw()
{
  image(outImg,0,0);
}
