//
//  Paddle.mm
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "Paddle.h"


@implementation Paddle
-(id) init{
    
    CGSize winSize = [CCDirector sharedDirector].winSize;
    
    
    //Creation of body of paddle
    //b2BodyDef paddleBodyDef;
    paddleBodyDef.type = b2_dynamicBody;
    paddleBodyDef.position.Set(winSize.width/2/PTM_RATIO, 100/PTM_RATIO);
    paddleBodyDef.userData=paddle;
    //_paddleBody = _world->CreateBody(&paddleBodyDef);
    
    
    //Create paddle shape
    
    b2PolygonShape paddleShape;
    paddleShape.SetAsBox(paddle.contentSize.width/PTM_RATIO,paddle.contentSize.height/PTM_RATIO);
    
    
    //defined kung ano yung magagalaw sa paddle. pag *1/2 ibig sabihin magagalaw yung kalahati
    
    //create shape definition and then add to body
    
    //b2FixtureDef paddleShapeDef;
    paddleShapeDef.shape = &paddleShape;
    paddleShapeDef.density = 10.0f;
    paddleShapeDef.friction=0.4f;
    paddleShapeDef.restitution = 1.0f;
    _paddleFixture = _paddleBody->CreateFixture(&paddleShapeDef);

    
    
    
    
}
@end
