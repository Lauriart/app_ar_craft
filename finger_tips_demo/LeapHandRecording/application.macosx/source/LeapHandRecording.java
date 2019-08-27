import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import de.voidplus.leapmotion.*; 
import java.util.List; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class LeapHandRecording extends PApplet {

/**
* Created by Lauren Edlin - July/August 2019
* Leap Motion Hand Recording:
* Records the fingertip positions using a LeapMotion sensor
*/

//LIBRARIES: ----------------------------
  //LeapMotion library
  //Access to ArrayLists



//GLOBAL VARIABLES: -----------------------

LeapMotion leap;   //LeapMotion object

//PVectors to store fingertip position coordinates
PVector indexTip;
PVector thumbTip;
PVector middleTip;
PVector ringTip;
PVector pinkyTip;

//Boolean switches
boolean leapMotionSwitch = false;   //LeapMotion screen on/off

//File writer to store finger tip recordings
PrintWriter recording;


//MAIN SETUP FUNCTION: -------------------------
public void setup() {
  
    //Set display screen size
  leap = new LeapMotion(this);   //Assign LeapMotion sensor 
  leapMotionSwitch = true;   //Turn on LeapMotion screen
  
  //Create a new file in the sketch directory to store LeapMotion recordings
  recording = createWriter("recording.txt"); 
  
 
}

//CALLBACK FUNCTIONS: ---------------------------
//check that the LeapMotion sensor is responding

public void leapOnInit() {
  println("Leap Motion Init");
}
public void leapOnConnect() {
  println("Leap Motion Connect");
}


//MAIN DRAW FUNCTION: -----------------------------
public void draw() {
  runLeapMotion();

}




//AUXILIARY FUNCTIONS: -----------------------------

//LeapMotion Sensor and Finger Tip Positions Recording: 
public void runLeapMotion() {
  
  if (leapMotionSwitch == true) {
    
    background(255);  //Screen colour
  
    //Put the frame number on the screen 
    int fps = leap.getFrameRate();
    text(fps + " fps", 20, 20);

    //Built-in drawing routine for showing hands 
    for (Hand hand : leap.getHands ()) {
    
      //Debugging - check that the corrent coordinates are being displayed on screen
      //Get the precise position of the index finger (x, y and z):
      //PVector indexTip = hand.getIndexFinger().getRawPositionOfJointTip();
      //text("x: " + nf(indexTip.x, 0, 1), 20, 40);
      //text("y: " + nf(indexTip.y, 0, 1), 20, 60);
      //text("z: " + nf(indexTip.z, 0, 1), 20, 80);
    
    
      //Get Finger Tip positions:
      //Show position of each finger tip on screen 
    
      indexTip = hand.getIndexFinger().getRawPositionOfJointTip();
      thumbTip = hand.getThumb().getRawPositionOfJointTip();
      middleTip = hand.getMiddleFinger().getRawPositionOfJointTip();
      ringTip = hand.getRingFinger().getRawPositionOfJointTip();
      pinkyTip = hand.getPinkyFinger().getRawPositionOfJointTip();
    
      //Record finger tip positions while LeapMotion runs:
      recordFingerTips();
      
      //record Frame
      recordFrame();
    
      //Debugging - Show positions on screen (just x positions)
      text("Index x: " + nf(indexTip.x, 0, 1), 20, 40);
      text("Thumb x: " + nf(thumbTip.x, 0, 1), 20, 60);
      text("Middle x: " + nf(middleTip.x, 0, 1), 20, 80);
      text("Ring x: " + nf(ringTip.x, 0, 1), 20, 100); 
      text("Pinky x: " + nf(pinkyTip.x, 0, 1), 20, 120); 
    
      hand.draw();
    }
    
  } else {
    print("LeapMotion sensor is off");
  }
}


//Record frame info by serializing to byte object and writing to file
public void recordFrame(){
  byte[] serializedFrame = leap.serialize();
  //Files.write(Paths.get("frame.data"), serializedFrame);
  
}


//Record Finger Tip Positions while LeapMotion Sensor runs: 
public void recordFingerTips() {
  
  //Write the finger tip coordinates to a file:
  
  //Thumb
  recording.print(thumbTip.x + ", " + thumbTip.z + ", ");
  
  //Index finger
  recording.print(indexTip.x + ", " + indexTip.z + ", ");
  
  //Middle finger
  recording.print(middleTip.x + ", " + middleTip.z + ", ");
  
  //Ring finger
  recording.print(ringTip.x + ", " + ringTip.z + ", ");
  
  //Pinky finger
  recording.print(pinkyTip.x + ", " + pinkyTip.z + "\n");
     
      
  //Debugging - Store finger positions from movements captured by the 
  //LeapMotion sensor in an ArrayList
  //indexPositions.add(new PVector(indexTip.x, indexTip.z));
  //thumbPositions.add(new PVector(thumbTip.x, thumbTip.z));
      
  //Debugging - print indexPosition coordinates to check
  //that they're being recorded
  print(indexTip.x, indexTip.z);
  
}


//When Mouse is Clicked, 
//Change screen from LeapMotion Sensor to Reproduce the Recoded Finger Tips:
public void mousePressed() {
  leapMotionSwitch = false;   //Turn off LeapMotion sensor 
  
  //Finalize the recording file:
  recording.flush();    //Write the remaining data to file
  recording.close();    //Finish the file
  exit();     //Stop the program

}
  public void settings() {  size(800, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "LeapHandRecording" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
