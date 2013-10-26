//
//  finger.h
//  videoGrabberExample
//
//  Created by Johann Diedrick on 6/8/13.
//
//

#ifndef videoGrabberExample_finger_h
#define videoGrabberExample_finger_h

#pragma once

class Finger{
    public:
        ofPoint position;
        ofPoint velocity;
        ofColor color;
    
    void init(int id){
        position.set(0,0);
        velocity.set(0,0);
        color.set(255,255,255,255);
    }
    
    void moveTo(int x, int y){
        position.set(x,y,0);
    }
    
    void draw(){
        ofSetColor(color);
        ofCircle(position.x, position.y, 20);
    }
};


#endif
