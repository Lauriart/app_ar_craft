# app_ar_craft
Site of the MAT APP project on Augmented Reality and Craft.

Instructions to run the two demos:

## Hand visualizer demo in Processing using Leap Motion.

1. You need a Leap Motion device connected to your machine.
2. Install the Leap Motion library within Processing.
3. To record images of your hand being detected by the Leap, run the processing sketch hand_demo/HandRecording/HandRecording.pde for several seconds as you move your hands over the Leap. You should see the skeleton detected. Stop the sketch after a few seconds of recording.
4. To playback those images run the sketch hand_demo/HandPlayback/HandPlayback.pde and you should see your hand as you've just recorded it.
5. To demo an AR project which detects a wooden block with a swiss cheese illustration on the side, run hand_demo/nyar4psg/examples/CheeseBloackVisualizer_Version2/CheeseBloackVisualizer_Version2.pde. Point the block towards your camera with the cheese image facing it and the app should recognize the image and begin playing your hand movements over it.
6. To create an app to track objects of your choice (not just the cheese image!), create the data files the app in step 5 requires by running the sketch hand_demo/yar4psg/examples/nftFilesGen/nftFilesGen.pde and then select the image you want to recognize from your file system. After it's created, make sure the app from step 5 points towards that data by modifying the code in line 28 by changing the file path argument of the nya.addNftTarget(...) method.

## Finger visualizer demo in Processing using Leap Motion.

1. Install Leap Motion (see steps 1 and 2 above).
2. To record your finger tips, run the sketch finger_tips_demo/LeapHandRecording/LeapHandRecording.pde. Move your hands around in front of the leap motion and see your movments recorded. Do this for several seconds then stop the sketch.
3. To playback your finger tips movements in an interesting visualization, run finger_tips_demo/LeapHandVisualization/LeapHandVisualization.pde



