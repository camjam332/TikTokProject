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
	
	void keyPressed(int key);
	void keyReleased(int key);
	void mouseMoved(int x, int y);
	void mouseDragged(int x, int y, int button);
	void mousePressed(int x, int y, int button);
	void mouseReleased(int x, int y, int button);
	void windowResized(int w, int h);
	void dragEvent(ofDragInfo dragInfo);
	void gotMessage(ofMessage msg);
    
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
