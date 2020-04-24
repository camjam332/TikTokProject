# Tik Tok Project
Made for Tik Tok Interactive Engineer project

Going through the most popular filters on Tik Tok I noticed that a lot of the trending filters dealt with either body tracking or image manipulation with frag shaders. Because of this, I chose to take a route combining the two.  

This is a video post processing effect that uses a C++ toolkit called openFrameworks and OpenCV to track the human body. This video effect takes the live video feed from the phone camera and masks it onto lines that are drawn onto the screen. The effect takes the vertices of each line and re-positions the vertex based on the brightness of a pixel giving it the warping effect. The user has the ability to change the resolution of the effect allowing either more lines to be rendered or less. This effect currently works on any iOS platform that has an RGB camera. 

![](https://github.com/camjam332/TikTokProject/blob/master/Sample-video.gif)

To download all files to your computer from GitHub, click the green "Clone or Download" button, then click, "Download Zip". The files being downloaded also includes a sample video of the effect in action.

![Download Project](https://github.com/camjam332/TikTokProject/blob/master/Screen%20Shot%202020-04-24%20at%201.54.29%20PM.png)
