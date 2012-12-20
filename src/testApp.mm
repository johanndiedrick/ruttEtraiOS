#include "testApp.h"
#include "ofGLUtils.h"
#include "ofGLRenderer.h"

//--------------------------------------------------------------
void testApp::setup(){	
	ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);

	ofSetFrameRate(30);

    cout << "Width: " << ofGetWidth() << " Height: " << ofGetHeight() << endl;
	grabber.initGrabber(ofGetWidth(), ofGetHeight(), OF_PIXELS_RGB);
	
    yStep = 3;
    xStep = 3;
    
  //  drawRuttEtra = false;
    
    ofBackground(0, 0, 0);
    
    grabber_w = grabber.getWidth();
    grabber_h = grabber.getHeight();

}

//--------------------------------------------------------------
void testApp::update(){
	//ofBackground(255,255,255);
	
	grabber.update();
	
    if(grabber.isFrameNew()){
    vidPixels = grabber.getPixelsRef();
        
        
    }
    
}

//--------------------------------------------------------------
void testApp::draw(){	

    glEnable(GL_DEPTH_TEST);

        int rowCount = 0;
    for (int y = 0; y<grabber_h; y+=yStep){
            ofNoFill();
            mesh.setMode(OF_PRIMITIVE_LINE_STRIP);
            
            if (rowCount % 2 == 0) {
                for (int x = 0; x < grabber_w; x += xStep){
              //  cout<<vidPixels.getColor(x,y) << endl;
                    //ofColor curColor = grabber.getPixelsRef().getColor(x,y);
                    
                    
                int loc = x + (y*grabber_w);
                                   
                ofColor curColor(grabber.getPixels()[loc], grabber.getPixels()[loc+1], grabber.getPixels()[loc+2]);
                               
                   // ofColor curColor(grabber.getPixels()[x+(y*(int)grabber.getWidth())], grabber.getPixels()[x+(y*(int)grabber.getWidth())+1], grabber.getPixels()[x+(y*(int)grabber.getWidth())+2]);
                    
                    mesh.addColor(ofColor(curColor));
                    mesh.addVertex(ofVec3f(x,y,  curColor.getBrightness() * 0.3));
                }
            } else {
                for (int x = grabber_w-1; x >= 0; x -= xStep){
                  //  ofColor curColor(grabber.getPixels()[x+(y*(int)grabber.getWidth())], grabber.getPixels()[x+(y*(int)grabber.getWidth())+1], grabber.getPixels()[x+(y*(int)grabber.getWidth())+2]);
                    
                    int loc = x + (y*grabber_w);
                    
                    ofColor curColor(grabber.getPixels()[loc], grabber.getPixels()[loc+1], grabber.getPixels()[loc+2]);
                    
                    mesh.addColor(ofColor(curColor));
                    mesh.addVertex(ofVec3f(x,y, curColor.getBrightness() * 0.3));
                }
            }
            rowCount++;
        }
    
    
    ofPushMatrix();
    //ofScale(.5,.5,1);
       mesh.draw();
    mesh.clear();
    ofPopMatrix();
  //  ofPopMatrix();
        grabber.draw(0,0, grabber.getWidth()/4, grabber.getHeight()/4);
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::lostFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotFocus(){
    
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning(){
    
}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
    
}


