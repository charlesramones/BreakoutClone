//
//  World.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "MyContactListener.h"
#import "Ball.h"
#import "bricks.h"
#import "Paddle.h"
#import "GUILabels.h"
#define PTM_RATIO 32.0

@interface MainController : CCLayerColor {
    
    
    b2World*world;
    b2Body *_groundBody;
    b2Fixture *_bottomFixture;
    MyContactListener *_contactListener;
    b2Vec2 force;
    GUILabels*gui;
    Ball*bola;
    bricks*blocks;
    Paddle*padel;
    
    
}


@property(nonatomic)b2World*world;


@end