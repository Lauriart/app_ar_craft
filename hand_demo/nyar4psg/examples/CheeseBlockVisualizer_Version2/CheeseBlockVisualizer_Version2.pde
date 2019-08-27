/**
 * Created by Lauren Edlin - July/August 2019
 * CheeseBlock Visualizer - Show visualizations of hand movements made
 * while drawing/painting the cheeseblock
 *
 * Adapted from: 
 * NyARToolkit for proce55ing/3.0.5 Example simpleNft
 * And LeapHandVisualizer
 */
 
 
import processing.video.*;
import jp.nyatla.nyar4psg.*;

Capture cam;   //Camera
MultiNft nya;  //Target
int counter; // counter of the images

BufferedReader reader;  //Initialize file reader

void setup() {
  counter = 0;
  size(640,480,P3D);
  colorMode(RGB, 100);
  println(MultiMarker.VERSION);
  cam=new Capture(this,640,480);
  nya=new MultiNft(this,width,height,"../../data/camera_para5.dat",NyAR4PsgConfig.CONFIG_PSG);
  nya.addNftTarget("../../data/CheeseBlockface",160);//id=0
  cam.start();
  
  reader = createReader("recording.txt");   //Assign reader to read the recording
  
}

void draw()
{
  if (cam.available() !=true) {
      return;
  }
  cam.read();
  nya.detect(cam);
  background(0);
  nya.drawBackground(cam);//frustumを考慮した背景描画
  if(!nya.isExist(0)){
      return;
  }
  nya.beginTransform(0);
  //Read the hand play back image from file and display on top
  
  nya.endTransform();
    
  counter++;
  String imageName = "/Users/laurenedlin/DeskTop/processing_leap/HandRecording/screen-" + nf(counter, 4) + ".tif";
  println(imageName);
  
  // replace white with transparent
  PImage img;
  PImage newImg;
  int x;
  int y;
  int i;
  
  img = loadImage( imageName );
  newImg = createImage( img.width, img.height, ARGB );
  for( x = 0; x < img.width; x++ ){
    for( y = 0; y < img.height; y++ ){
      i = ( ( y * img.width ) + x );
      if( img.pixels[i] == color( 255, 255, 255 ) ){
        newImg.pixels[i] = color( 0, 0, 0, 0 );
      } 
      else {
        newImg.pixels[i] = img.pixels[i];
      }
    }
  }
  //newImg.save( FILENAME );
  //image(loadImage(imageName),0,0);
  image(newImg, 0, 0);
 



  
}
