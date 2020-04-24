# Tik Tok Project
Made for Tik Tok Interactive Engineer project

Going through the most popular filters on Tik Tok I noticed that a lot of the trending filters dealt with either body segmentation or image manipulation, so I chose to take a route combining the two.  

This is a video post processing effect that uses a C++ toolkit called openFrameworks and OpenCV to track the human body. This video effect takes the video feed from the camera and masks it onto lines that are drawn onto the screen. The effect takes the vertices of each line and repositions the vertex based on the brightness of a pixel giving it the warping effect. The user has the ability to change the resolution of the effect allowing either more lines to be rendered or less. This effect currently works on any iOS platform that has an RGB camera. 
