//
//  Ball.m
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"


@implementation Ball

-(id) init
{
    
    
    b2World*_world;
    
    b2Vec2 gravity = b2Vec2 (0.0f, 0.0f);
    
    _world = new b2World(gravity);
    
    
    ball = [CCSprite spriteWithFile:@"redball.png" rect:CGRectMake(0, 0, 20, 20) ];
    ball.position = ccp(100,100);
    
    ball.tag = 1;
    //tag is used for identification process
    
   
   
    
    
   
    ballBodyDef.type = b2_dynamicBody; //because the ball is moving. static for fixed
    ballBodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
    ballBodyDef.userData = ball;
    ballBody = _world->CreateBody(&ballBodyDef);
    
    //Create a circle shape for the ball
    
    b2CircleShape circle;
    circle.m_radius = 15.0/PTM_RATIO;
    
    //Create shape defintion and then add it to body
    
    
   
    ballShapeDef.shape = &circle;
    ballShapeDef.density= 1.0f;
    ballShapeDef.friction = 0.f;
    ballShapeDef.restitution = 1.0f; //perfectly elastic C = BEFORE2-BEFORE1/AFTER1-AFTER2
    
    _ballFixture = ballBody->CreateFixture(&ballShapeDef);
    
    //force for the object to move
    
    //force = b2Vec2(7,7);
    //ballBody->ApplyLinearImpulse(force, ballBodyDef.position);
    

    
    
    
    
    
    
}

@end
