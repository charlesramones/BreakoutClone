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
#define PTM_RATIO 32.0

@interface World : CCLayerColor {
    
    
    b2World*_world;
    b2Body *_groundBody;
    b2Fixture *_bottomFixture;
    MyContactListener *_contactListener;
    b2Vec2 force;
    
}

@property(nonatomic)b2World*_world;

@end
