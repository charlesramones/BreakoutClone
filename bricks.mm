//
//  bricks.m
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "bricks.h"


@implementation bricks


-(bricks*)initWithWorld:(b2World*)world
{
if (self=[super init])
{
    
    
    for (int i = 0; i<31; i++)
    {
       
        static int padding=0;
        int xOffset = padding+block2.contentSize.width+((block2.contentSize.width+padding)*i);
        
        block = [CCSprite spriteWithFile:@"square.png"];
        xOffset = padding+block.contentSize.width+((block.contentSize.width+padding)*i);
        block.position = ccp(xOffset, 340);
        block.tag = 2;
        //[self addChild:block];
        
        
        
        
        
        //blockshape
        
        b2PolygonShape blockShape;
        blockShape.SetAsBox(block.contentSize.width/PTM_RATIO, block.contentSize.height/PTM_RATIO);
        
       
        blockBodyDef.type = b2_staticBody;
        blockBodyDef.position.Set(xOffset/PTM_RATIO, 340/PTM_RATIO);
        blockBodyDef.userData=block;
        //b2Body *blockBody =_world->CreateBody(&blockBodyDef);
        
        //shape definition
        
        b2FixtureDef blockShapeDef;
        blockShapeDef.shape = &blockShape;
        blockShapeDef.density=10.0;
        blockShapeDef.friction = 0.0;
        blockShapeDef.restitution=1.0f;
       // blockBody->CreateFixture(&blockShapeDef);
        
     
        
        
    }
    

    
    
    
    
    
    
    
    for (int i = 0; i<31; i++)
    {
        static int padding=0;
        int xOffset = padding+block2.contentSize.width+((block2.contentSize.width+padding)*i);
        
        
       block2 = [CCSprite spriteWithFile:@"square.png"];
        xOffset = padding+block2.contentSize.width+((block2.contentSize.width+padding)*i);
        block2.position = ccp(xOffset, 330);
        block2.tag = 2;
        //[self addChild:block2];
        
        
       
        
        
        //blockshape
        
        b2PolygonShape block2Shape;
        block2Shape.SetAsBox(block2.contentSize.width/PTM_RATIO, block2.contentSize.height/PTM_RATIO);
        
    
        block2BodyDef.type = b2_staticBody;
        block2BodyDef.position.Set(xOffset/PTM_RATIO, 330/PTM_RATIO);
        block2BodyDef.userData=block2;
        b2Body *block2Body = world->CreateBody(&block2BodyDef);
        //shape definition
        
       b2FixtureDef block2ShapeDef;
        block2ShapeDef.shape = &block2Shape;
        block2ShapeDef.density=10.0;
        block2ShapeDef.friction = 0.0;
        block2ShapeDef.restitution=1.0f;
        block2Body->CreateFixture(&block2ShapeDef);
        
      
        
        
    }
    
    for (int i = 0; i<31; i++)
    {
        static int padding=0;
        int xOffset = padding+block2.contentSize.width+((block2.contentSize.width+padding)*i);
        
        
        block3 = [CCSprite spriteWithFile:@"square.png"];
        
        block3.position = ccp(xOffset, 320);
        block3.tag = 2;
       // [self addChild:block3];
        
        
       
        
        
        //blockshape
        
        b2PolygonShape block3Shape;
        block3Shape.SetAsBox(block3.contentSize.width/PTM_RATIO, block3.contentSize.height/PTM_RATIO);
        
        block3BodyDef.type = b2_staticBody;
        block3BodyDef.position.Set(xOffset/PTM_RATIO, 330/PTM_RATIO);
        block3BodyDef.userData=block3;
        b2Body *block3Body = world->CreateBody(&block3BodyDef);
        
        
        
        //shape definition
        
        b2FixtureDef block3ShapeDef;
        block3ShapeDef.shape = &block3Shape;
        block3ShapeDef.density=10.0;
        block3ShapeDef.friction = 0.0;
        block3ShapeDef.restitution=1.0f;
       block3Body->CreateFixture(&block3ShapeDef);
        
        
       
       
       
        
        
    }

    
    return self;
}
    
}

@end
