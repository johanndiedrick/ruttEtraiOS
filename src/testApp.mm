#include "testApp.h"
#include "ofGLUtils.h"
#include "ofGLRenderer.h"


//SPECIAL THANKS TO ANDY, KYLE, DAN, JAMES, ROBBIE AND OMER XOXO<33333

//--------------------------------------------------------------
void testApp::setup(){	
	ofxiPhoneSetOrientation(OFXIPHONE_ORIENTATION_LANDSCAPE_RIGHT);
    ofSetLogLevel(OF_LOG_VERBOSE);

	ofSetFrameRate(30);
    
   // cout << "Width: " << ofGetWidth() << " Height: " << ofGetHeight() << endl;
    //grabber.setDeviceID(1);
	grabber.initGrabber(ofGetWidth(), ofGetHeight(), OF_PIXELS_RGB);
	
    yStep = 3;
    xStep = 3;
    
  //  drawRuttEtra = false;
    
    ofBackground(0, 0, 0);
    
    grabber_w = grabber.getWidth();
    grabber_h = grabber.getHeight();
    
    cout << "Grabber width: " << grabber_w << " Grabber height: " << grabber_h << endl;

    
    front_camera=true;
    
    fingers.assign(2, Finger());
    
    for(int i=0; i<fingers.size(); i++){
        fingers[i].init(i);
    }
    distance = 3; //initial xstep/ystep
    distInt = 3;
     
}

//--------------------------------------------------------------
void testApp::update(){
	grabber.update();
    /*
    if (distance<3){
        distance=3;
    }
    distance = ofDist(fingers[0].position.x, fingers[0].position.y, fingers[1].position.x, fingers[1].position.y);
    
    distance = ofMap(distance, 40, 250, 3, 30);
    

 
    if (distance<3){
        distance=3;
    }
    
    distInt = (int)distance;

    ofLog(OF_LOG_VERBOSE, "distance is %i", distInt);
   // ofLog(OF_LOG_VERBOSE, "f1 x,y is %f, %f and f2 x,y is %f, %f", fingers[0].position.x, fingers[0].position.y, fingers[1].position.x, fingers[1].position.y);

    //yStep = distInt;
    */
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
                    
                  //  ofColor curColor = grabber.getPixelsRef();
                    int loc = x*xStep + (y*grabber_w*yStep);
                                   
                    ofColor curColor(grabber.getPixels()[loc], grabber.getPixels()[loc+1], grabber.getPixels()[loc+2]);
                               
                   // ofColor curColor(grabber.getPixels()[x+(y*(int)grabber.getWidth())], grabber.getPixels()[x+(y*(int)grabber.getWidth())+1], grabber.getPixels()[x+(y*(int)grabber.getWidth())+2]);
                    
                    mesh.addColor(ofColor(curColor));
                    mesh.addVertex(ofVec3f(x,y,  curColor.getBrightness() * 0.3));
                }
            } else {
                for (int x = grabber_w-1; x >= 0; x -= xStep){
                  //  ofColor curColor(grabber.getPixels()[x+(y*(int)grabber.getWidth())], grabber.getPixels()[x+(y*(int)grabber.getWidth())+1], grabber.getPixels()[x+(y*(int)grabber.getWidth())+2]);
                    
                  //  int loc = x + (y*grabber_w);
                    int loc = x*xStep + (y*grabber_w*yStep);

                    ofColor curColor(grabber.getPixels()[loc], grabber.getPixels()[loc+1], grabber.getPixels()[loc+2]);
                    
                    mesh.addColor(ofColor(curColor));
                    mesh.addVertex(ofVec3f(x,y, curColor.getBrightness() * 0.3));
                }
            }
            rowCount++;
        }
    
    
  //  ofPushMatrix();
    //ofScale(.5,.5,1);
       mesh.draw();
    mesh.clear();
   // ofPopMatrix();
  //  ofPopMatrix();
    //    grabber.draw(0,0, grabber.getWidth()/4, grabber.getHeight()/4);
    
    //draw line for positions
    
    /*
    for (int i=0; i<fingers.size(); i++) {
        fingers[i].draw();
    }
    
    ofLine(fingers[0].position.x, fingers[0].position.y, fingers[1].position.x, fingers[1].position.y);
    */
    
    
}

//--------------------------------------------------------------
void testApp::exit(){
    
}

//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
  //  ofLog(OF_LOG_VERBOSE, "touch %d down at (%d,%d)", touch.id, touch.x, touch.y);
    fingers[touch.id].moveTo(touch.x, touch.y);

}

//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
 //   ofLog(OF_LOG_VERBOSE, "touch %d moved at (%d,%d)", touch.id, touch.x, touch.y);
    fingers[touch.id].moveTo(touch.x, touch.y);


}

//--------------------------------------------------------------
void testApp::touchUp(ofTouchEventArgs & touch){

}

//--------------------------------------------------------------
void testApp::touchDoubleTap(ofTouchEventArgs & touch){
//    ofLog(OF_LOG_VERBOSE, "touch %d double tap at (%d,%d)", touch.id, touch.x, touch.y);
    front_camera = !front_camera;
    cout<<front_camera<<endl;
    
    if(front_camera){
        grabber.close();
        grabber.initGrabber(ofGetWidth(), ofGetHeight(), OF_PIXELS_RGB);
        grabber.setDeviceID(0);

    }else
        grabber.close();
    grabber.initGrabber(ofGetWidth(), ofGetHeight(), OF_PIXELS_RGB);
    grabber.setDeviceID(1);


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


