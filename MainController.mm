//
//  World.mm
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import "MainController.h"


@implementation MainController





+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	MainController *layer = [MainController node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id)init
{
    
    if (self = [super init]) {
        
    
    
    
        
        CGSize winSize = [CCDirector sharedDirector].winSize;
    
        b2Vec2 gravity = b2Vec2 (0.0f, 0.0f);
        
        world = new b2World(gravity);
    
       bola = [[Ball alloc]initWithWorld:world];
       blocks = [[bricks alloc]initWithWorld:world];
       padel = [[Paddle alloc]initWithWorld:world];
        
        gui = [[GUILabels alloc]init];
   
        
        
        
        [self addChild:bola.ball];
        [self addChild:blocks.block];
        [self addChild:blocks.block2];
        [self addChild:blocks.block3];
        [self addChild:padel];
        
   
     
        
        
        
    
    b2BodyDef groundBodyDef;
    groundBodyDef.position.Set(0,0);
    _groundBody = _world->CreateBody(&groundBodyDef);
    
    b2EdgeShape groundBox;
    b2FixtureDef groundBoxDef;
    groundBoxDef.shape = &groundBox;
    
    groundBox.Set(b2Vec2(0,0), b2Vec2(winSize.width/PTM_RATIO, 0));
    _bottomFixture = _groundBody->CreateFixture(&groundBoxDef);
    
    groundBox.Set(b2Vec2(0,0), b2Vec2(0, winSize.height/PTM_RATIO));
    _groundBody->CreateFixture(&groundBoxDef);
    
    groundBox.Set(b2Vec2(0, winSize.height/PTM_RATIO), b2Vec2(winSize.width/PTM_RATIO,
                                                              winSize.height/PTM_RATIO));
    _groundBody->CreateFixture(&groundBoxDef);
    
    groundBox.Set(b2Vec2(winSize.width/PTM_RATIO, winSize.height/PTM_RATIO),
                  b2Vec2(winSize.width/PTM_RATIO, 0));
    _groundBody->CreateFixture(&groundBoxDef);
    
   
    
    
    
        
       
      
    
        
        
        
        
        
        
        
        
    }



}

-(void)update:(ccTime)dt
{
    world->Step(dt, 10, 10);
   
    for (b2Body *b = _world->GetBodyList(); b; b=b->GetNext()) {
        if(b->GetUserData() != NULL){
            CCSprite *ballData = (CCSprite *)b->GetUserData();
            if (ballData.tag == 1) {
                static int maxSpeed = 10;
                
                b2Vec2 velocity = b->GetLinearVelocity();
                float32 speed = velocity.Length();
                
                if (speed > maxSpeed) {
                    b->SetLinearDamping(0.5);
                } else if (speed < maxSpeed) {
                    b->SetLinearDamping(0.0);
                }
                
            }
            ballData. position = ccp(b->GetPosition().x*PTM_RATIO, b->GetPosition().y*PTM_RATIO);
            ballData.rotation = -1 * CC_RADIANS_TO_DEGREES(b->GetAngle());
            
            
        }
    }
    
    
    
    if (CGRectIntersectsRect(gui.powerUp.boundingBox,padel.paddle.boundingBox)) {
        
        gui.powerUp.visible = NO;
        
        gui.powerUp = NULL;
        
    
        
    }
    
    


}

@end
