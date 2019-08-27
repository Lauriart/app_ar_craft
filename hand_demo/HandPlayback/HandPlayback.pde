/**
 * Created by Lauren Edlin - July/August 2019
 * Leap Motion Hand Recording: 
 * Plays series of recorded display screens of leap motion hand positions 
 */




int counter;

void setup() {
  size(800, 500);
  // ...
  counter = 0;
}


void draw(){
  background(#FC0828);
  
  
  counter++;
  String imageName = "../HandRecording/hand_images/screen-" + nf(counter, 4) + ".tif";
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
