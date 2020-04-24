#pragma once

#include "ofMain.h"
#include "ofxCv.h"
#include "ofxGui.h"
#include "ofxOpenCv.h"

using namespace ofxCv;
using namespace cv;

class ofApp : public ofBaseApp{
	public:
		
	void setup();
	void update();
	void draw();
    
    ofVideoGrabber grabber;

    ofShader shader;
    ofImage image;
    ofImage imageMask;
    
    unsigned char * pix;
    ofTexture tex;
    ofFbo fbo;
    ofImage imgDifference;
    ofImage gray, edge, sobel;
    ofPixels pxPrevious;
    
    ofxPanel gui;
    
    ofParameterGroup sliderGroup;
    ofParameter<int> intSlider;
    ofParameter<float> floatSliderX;
    ofParameter<float> floatSliderY;
    ofParameterGroup mainGroup;
    
    int x;
    int y;
};
