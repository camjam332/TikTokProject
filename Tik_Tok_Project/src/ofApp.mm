#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    
#ifdef TARGET_OPENGLES
	shader.load("shadersES2/shader");
#else
	if(ofIsGLProgrammableRenderer()){
		shader.load("shadersGL3/shader");
	}else{
		shader.load("shadersGL2/shader");
	}
#endif
    grabber.setDeviceID(1);
    grabber.setup(ofGetWidth(), ofGetHeight(), OF_PIXELS_BGRA);
    fbo.allocate(grabber.getWidth(), grabber.getHeight());
    fbo.begin();
    ofClear(255, 255, 255);
    tex.allocate(grabber.getWidth(), grabber.getHeight(), GL_RGB);
    
    sliderGroup.add(intSlider.set("int slider", 4, 2, 8));
    sliderGroup.add(floatSliderX.set("float slider X", 1, 1, 30));
    sliderGroup.add(floatSliderY.set("float slider Y", 1, 1, 30));
    
    mainGroup.add(sliderGroup);
    gui.setup(mainGroup);
    
    ofxCv::imitate(pxPrevious, grabber);
    ofxCv::imitate(imgDifference, grabber);
    
    pix = new unsigned char[ (int)( grabber.getWidth() * grabber.getHeight() * 3.0) ];
    fbo.end();
}

//--------------------------------------------------------------
void ofApp::update(){
    ofBackground(0);
    grabber.update();
    
    if(grabber.isFrameNew())
    {
        convertColor(grabber, gray, CV_RGB2GRAY);
        Canny(gray, edge, mouseX, mouseY, 3);
        Sobel(gray, sobel);
        gray.update();
        sobel.update();
        edge.update();
        
        absdiff(grabber, pxPrevious, imgDifference);
        
        imgDifference.update();
        
        copy(grabber, pxPrevious);
        
    }
    
    if(grabber.isFrameNew() == true) {
        ofPixels & pixels = grabber.getPixels();
        unsigned char * src = pixels.getData();
        int totalPix = grabber.getWidth() * grabber.getHeight() * 3;
        
        for(int k = 0; k < totalPix; k+= 3){
            pix[k  ] = 255 - src[k];
            pix[k+1] = 255 - src[k+1];
            pix[k+2] = 255 - src[k+2];
        }
        
        tex.loadData(pix, grabber.getWidth(), grabber.getHeight(), GL_RGB);
    }
}

//--------------------------------------------------------------
void ofApp::draw(){
    
    fbo.begin();
    ofClear(0);
    //ofBackground(255);
    for(int i = 0; i < tex.getHeight(); i += intSlider)
        {
            ofPolyline polyline;
            for(int j = 0; j < tex.getWidth(); j++)
            {
                ofColor color = imgDifference.getPixels().getColor(j, i);
                int brightness = color.getBrightness();
                polyline.addVertex(j , i + ofMap(brightness, 0, 255, 0, -64));
            }
            polyline = polyline.getSmoothed(10);
            //polyline.scale(floatSliderX,floatSliderY);
            //ofSetColor(0);
            polyline.draw();
        }
    fbo.end();
    
    shader.begin();
    shader.setUniformTexture("imageMask", fbo.getTexture(), 1);
    
    //fbo.draw(0,0);
    //tex.draw(0, 0, ofGetWidth(), ofGetHeight());
    grabber.draw(0, 0, ofGetWidth(), ofGetHeight());

    shader.end();
    
    gui.draw();
    
}

//--------------------------------------------------------------
void ofApp::keyPressed(int key){
    
}

//--------------------------------------------------------------
void ofApp::keyReleased(int key){

}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y){
    
}

//--------------------------------------------------------------
void ofApp::mouseDragged(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::mouseReleased(int x, int y, int button){

}

//--------------------------------------------------------------
void ofApp::windowResized(int w, int h){

}

//--------------------------------------------------------------
void ofApp::gotMessage(ofMessage msg){

}

//--------------------------------------------------------------
void ofApp::dragEvent(ofDragInfo dragInfo){ 

}
