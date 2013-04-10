//
//  Paddle.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#define PTM_RATIO 32.0

@interface Paddle : CCLayer{
    
    b2Body *_paddleBody;
    b2Fixture *_paddleFixture;
    CCSprite *paddle;
    b2FixtureDef paddleShapeDef;
    b2BodyDef paddleBodyDef;
    
    
    
    
    
}
@property(nonatomic, strong) CCSprite*paddle;


@end
