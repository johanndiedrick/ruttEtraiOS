#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "finger.h"

class testApp : public ofxiPhoneApp{
	
	public:
        void setup();
        void update();
        void draw();
        void exit();
    
        void touchDown(ofTouchEventArgs & touch);
        void touchMoved(ofTouchEventArgs & touch);
        void touchUp(ofTouchEventArgs & touch);
        void touchDoubleTap(ofTouchEventArgs & touch);
        void touchCancelled(ofTouchEventArgs & touch);
	
        void lostFocus();
        void gotFocus();
        void gotMemoryWarning();
        void deviceOrientationChanged(int newOrientation);
		
        ofVideoGrabber frontCamera;
        ofVideoGrabber  backCamera;
		ofVideoGrabber grabber;
		ofTexture tex;
		unsigned char * pix;
    
        //rutt etra effect
    
        int yStep;
        int xStep;
        bool drawRuttEtra;
    ofMesh mesh;

        ofPixels vidPixels;
    
    int grabber_w;
    int grabber_h;
    bool front_camera;
    
    vector<Finger> fingers;
    
    float distance;
    int distInt;

};
