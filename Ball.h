//
//  Ball.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#define PTM_RATIO 32.0

@interface Ball : CCLayer {
    
    
    CCSprite *ball;
    b2Body *ballBody;
    b2BodyDef ballBodyDef;
    b2Fixture *_ballFixture;
    b2FixtureDef ballShapeDef;


}
@property(nonatomic, strong)CCSprite *ball;
@property(nonatomic)b2BodyDef ballBodyDef;
-(Ball*)initWithWorld:(b2World*)world;

@end
