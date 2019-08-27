/**
 * Created by Lauren Edlin - July/August 2019
 * Leap Motion Visualization: 
 * Reproduces the fingertip positions recorded using the LeapHandRecording program
 */


//GLOBAL VARIABLES:
BufferedReader reader;  //Initialize file reader


//MAIN SETUP FUNCTION: ------------------------
void setup() {

  size(800, 500);  //Set display screen size
  background(255); //Set background as white
  reader = createReader("recording.txt");   //Assign reader to read the recording
}



//MAIN DRAW FUNCTION: ---------------------------
void draw() {

  //Read the fingertip coordinates from the file, and display them on the screen
  String line = null; 
  try {
    line = reader.readLine();  //Read each line of the file
    if (line != null) {
      String[] coords = line.split(",");  //Split each line at the commas

      //Assign a double variable to each coordinate read from the file:
      double thumbx = Double.parseDouble(coords[0]);
      double thumbz = Double.parseDouble(coords[1]);
      double indexx = Double.parseDouble(coords[2]);
      double indexz = Double.parseDouble(coords[3]);
      double middlex = Double.parseDouble(coords[4]);
      double middlez = Double.parseDouble(coords[5]);
      double ringx = Double.parseDouble(coords[6]);
      double ringz = Double.parseDouble(coords[7]);
      double pinkyx = Double.parseDouble(coords[8]);
      double pinkyz = Double.parseDouble(coords[9]); 

      //Print the fingertip coordinates on the display screen:
      
      translate(width/2, height/2);   //Move screen achor points
      
      //Thumb
      stroke(#000AF5); //Make the points blue
      strokeWeight(5);  //Make points a bit thicker
      point((float)thumbx, (float)thumbz);    //Cast doubles as floats
      
      //Index
      stroke(#019032); //Make the points green
      strokeWeight(5);  //Make points a bit thicker
      point((float)indexx, (float)indexz);    //Cast doubles as floats
      
      //Middle
      stroke(#D3F500); //Make the points yellow
      strokeWeight(5);  //Make points a bit thicker
      point((float)middlex, (float)middlez);    //Cast doubles as floats
      
      //Ring
      stroke(#F59300); //Make the points orange
      strokeWeight(5);  //Make points a bit thicker
      point((float)ringx, (float)ringz);    //Cast doubles as floats
      
      //Pinky
      stroke(#F00000); //Make the points red
      strokeWeight(5);  //Make points a bit thicker
      point((float)pinkyx, (float)pinkyz);    //Cast doubles as floats
      
    }
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}



//AUXILIARY FUNCTIONS: -------------------------
