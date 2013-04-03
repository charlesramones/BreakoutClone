//
//  HelloWorldLayer.mm
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 3/27/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//

// Import the interfaces
#import "HelloWorldLayer.h"
#import "GameOverScreen.h"
#import "AppDelegate.h"
#define kNumBonus 2






@implementation HelloWorldLayer

@synthesize secs, mins, totalTimeString, timeInt, lives;

 



+(id) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

-(id) init
{
    
	if( (self=[super init])){
    CGSize winSize = [CCDirector sharedDirector].winSize;
        
        
        totalTimeString = @"30";
        
        timeInt = 30;
        
        counterForLifeHeart = 3;        
        
        
     
        
        timer = [[CCLabelTTF labelWithString:totalTimeString dimensions:CGSizeMake(130, 27)hAlignment:kCCTextAlignmentCenter fontName:@"Marker Felt" fontSize:25.0]retain];
        
        
        
        timer.position = ccp(155, 425);
        [self schedule:@selector(tick2:)interval: 1.0];
        [self addChild:timer z:3 tag: timeInt];
        
        //lives hearts
        
        
        lifeHeart1 = [CCSprite spriteWithFile:@"star.png"];
        [lifeHeart1 setPosition:CGPointMake(15, 470)];
        [self addChild:lifeHeart1];
        
        lifeHeart2 = [CCSprite spriteWithFile:@"star.png"];
        [lifeHeart2 setPosition:CGPointMake(45, 470)];
        [self addChild:lifeHeart2];
        
        lifeHeart3 = [CCSprite spriteWithFile:@"star.png"];
        [lifeHeart3 setPosition:CGPointMake(75, 470)];
        [self addChild:lifeHeart3];

        
        
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"Level 1" fontName:@"Marker Felt" fontSize:40];
        title.position = ccp(155, 450);
        [self addChild:title];
    
      
   
        
        
       
        
        
   //Create a sprite for the ball
        
        CCSprite *ball = [CCSprite spriteWithFile:@"redball.png" rect:CGRectMake(0,0,52,52)];
        ball.position = ccp(100,100);
        
        ball.tag = 1;
        //tag is used for identification process
        
        [self addChild:ball];
        
        
        //create a world
        
        b2Vec2 gravity = b2Vec2 (0.0f, 0.0f);
        
        
        _world = new b2World(gravity);
        
        
    //creation of edges in the screen
        //Gravity is zero so that the ball will continue to move
        
        b2BodyDef groundBodyDef;
        groundBodyDef.position.Set(0,0);
        _groundBody = _world->CreateBody(&groundBodyDef);
        
        b2EdgeShape groundBox;
        b2FixtureDef groundBoxDef;
        groundBoxDef.shape = &groundBox;
        
        
        groundBox.Set(b2Vec2(0,0), b2Vec2(winSize.width/PTM_RATIO, 0));
        _bottomFixture = _groundBody->CreateFixture(&groundBoxDef);
        
        
        groundBox.Set(b2Vec2(0,0), b2Vec2(0,winSize.height/PTM_RATIO));
        _groundBody->CreateFixture(&groundBoxDef);
        
        groundBox.Set(b2Vec2(0,winSize.height/PTM_RATIO), b2Vec2(winSize.width/PTM_RATIO, winSize.height/PTM_RATIO));
        _groundBody->CreateFixture(&groundBoxDef);
        
        
        groundBox.Set(b2Vec2(winSize.width/PTM_RATIO, winSize.height/PTM_RATIO), b2Vec2(winSize.width/PTM_RATIO,0));
        _groundBody->CreateFixture(&groundBoxDef);
        
    //create a ball body
        
        
        b2BodyDef ballBodyDef;
        ballBodyDef.type = b2_dynamicBody; //because the ball is moving. static for fixed
        ballBodyDef.position.Set(100/PTM_RATIO, 100/PTM_RATIO);
        ballBodyDef.userData = ball;
        b2Body *ballBody = _world->CreateBody(&ballBodyDef);
        
    //Create a circle shape for the ball
        
        b2CircleShape circle;
        circle.m_radius = 15.0/PTM_RATIO;
        
    //Create shape defintion and then add it to body
        
        b2FixtureDef ballShapeDef;
        ballShapeDef.shape = &circle;
        ballShapeDef.density= 1.0f;
        ballShapeDef.friction = 0.f;
        ballShapeDef.restitution = 1.0f; //perfectly elastic C = BEFORE2-BEFORE1/AFTER1-AFTER2
        
        _ballFixture = ballBody->CreateFixture(&ballShapeDef);
 
        
       
    //force for the object to move
        
        b2Vec2 force = b2Vec2(7,7);
        ballBody->ApplyLinearImpulse(force, ballBodyDef.position);
        
        
        //Create paddle and add to layer
        
       paddle = [CCSprite spriteWithFile:@"small-button-over.png"];
        
        paddle.position=ccp(winSize.width/2,200);
        
        
        [self addChild:paddle];
        
        self.isAccelerometerEnabled = YES;
        
       
        [[UIAccelerometer sharedAccelerometer]setUpdateInterval:(1.0/30)];
        
        
        
        
        //Creation of body of paddle
        b2BodyDef paddleBodyDef;
        paddleBodyDef.type = b2_dynamicBody;
        paddleBodyDef.position.Set(winSize.width/2/PTM_RATIO, 100/PTM_RATIO);
        paddleBodyDef.userData=paddle;
        _paddleBody = _world->CreateBody(&paddleBodyDef);
        
        
        //Create paddle shape
        
        b2PolygonShape paddleShape;
        paddleShape.SetAsBox(paddle.contentSize.width/PTM_RATIO, paddle.contentSize.height/PTM_RATIO);
        
        
        //defined kung ano yung magagalaw sa paddle. pag *1/2 ibig sabihin magagalaw yung kalahati
        
        //create shape definition and then add to body
        
        b2FixtureDef paddleShapeDef;
        paddleShapeDef.shape = &paddleShape;
        paddleShapeDef.density = 10.0f;
        paddleShapeDef.friction=0.4f;
        paddleShapeDef.restitution = 1.0f;
        _paddleFixture = _paddleBody->CreateFixture(&paddleShapeDef);
        
        _contactListener = new MyContactListener();
        _world->SetContactListener(_contactListener);
        
        
        //bricks
        
        for (int i = 0; i<31; i++)
        {
            static int padding=0;
            
            
            CCSprite *block = [CCSprite spriteWithFile:@"square.png"];
            int xOffset = padding+block.contentSize.width+((block.contentSize.width+padding)*i);
            block.position = ccp(xOffset, 340);
            block.tag = 2;
            [self addChild:block];
            
            
            //create block body
            b2BodyDef blockBodyDef;
            blockBodyDef.type = b2_staticBody;
            blockBodyDef.position.Set(xOffset/PTM_RATIO, 340/PTM_RATIO);
            blockBodyDef.userData=block;
            b2Body *blockBody = _world->CreateBody(&blockBodyDef);
            
            
            //blockshape
            
            b2PolygonShape blockShape;
            blockShape.SetAsBox(block.contentSize.width/PTM_RATIO, block.contentSize.height/PTM_RATIO);
            
            
            
            //shape definition
            
            b2FixtureDef blockShapeDef;
            blockShapeDef.shape = &blockShape;
            blockShapeDef.density=10.0;
            blockShapeDef.friction = 0.0;
            blockShapeDef.restitution=1.0f;
            blockBody->CreateFixture(&blockShapeDef);
            
      

            
        }
        
        
        
        
        
        for (int i = 0; i<31; i++)
        {
            static int padding=0;
            
            
            CCSprite *block2 = [CCSprite spriteWithFile:@"square.png"];
            int xOffset = padding+block2.contentSize.width+((block2.contentSize.width+padding)*i);
            block2.position = ccp(xOffset, 330);
            block2.tag = 2;
            [self addChild:block2];
            
            
            //create block body
            b2BodyDef block2BodyDef;
            block2BodyDef.type = b2_staticBody;
            block2BodyDef.position.Set(xOffset/PTM_RATIO, 330/PTM_RATIO);
            block2BodyDef.userData=block2;
            b2Body *block2Body = _world->CreateBody(&block2BodyDef);
            
            
            //blockshape
            
            b2PolygonShape block2Shape;
            block2Shape.SetAsBox(block2.contentSize.width/PTM_RATIO, block2.contentSize.height/PTM_RATIO);
            
            
            
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
            
            
            CCSprite *block3 = [CCSprite spriteWithFile:@"square.png"];
            int xOffset = padding+block3.contentSize.width+((block3.contentSize.width+padding)*i);
            block3.position = ccp(xOffset, 320);
            block3.tag = 2;
            [self addChild:block3];
            
            
            //create block body
            b2BodyDef block3BodyDef;
            block3BodyDef.type = b2_staticBody;
            block3BodyDef.position.Set(xOffset/PTM_RATIO, 320/PTM_RATIO);
            block3BodyDef.userData=block3;
            b2Body *block3Body = _world->CreateBody(&block3BodyDef);
            
            
            //blockshape
            
            b2PolygonShape block3Shape;
            block3Shape.SetAsBox(block3.contentSize.width/PTM_RATIO, block3.contentSize.height/PTM_RATIO);
            
            
            
            //shape definition
            
            b2FixtureDef block3ShapeDef;
            block3ShapeDef.shape = &block3Shape;
            block3ShapeDef.density=10.0;
            block3ShapeDef.friction = 0.0;
            block3ShapeDef.restitution=1.0f;
            block3Body->CreateFixture(&block3ShapeDef);
            
            
            
            
        }

        
            
            //restrict paddle movement
            
            b2PrismaticJointDef jointDef;
            b2Vec2 worldAxis(1.0f,0.0f);
            jointDef.collideConnected=true;
            jointDef.Initialize(_paddleBody, _groundBody, _paddleBody->GetWorldCenter(), worldAxis);
            _world->CreateJoint(&jointDef);
            
            
            
                       
        
        
    
        
        [self schedule:@selector(update: )];
        
        
        
                      
        

    }
		return self;
        
    }





-(void)update:(ccTime)dt
{
    _world->Step(dt, 10, 10);
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
    
  
 
    
    std::vector<b2Body *>toDestroy;
    std::vector<MyContact>::iterator pos;
    for (pos=_contactListener->_contacts.begin();
         pos != _contactListener->_contacts.end(); ++pos) {
        MyContact contact = *pos;
        
        if ((contact.fixtureA == _bottomFixture && contact.fixtureB == _ballFixture) ||
            (contact.fixtureA == _ballFixture && contact.fixtureB == _bottomFixture)) {
            
            [paddle runAction:[CCBlink actionWithDuration:0.5 blinks:9]];
            
            
            if (lifeHeart3.visible==YES){
                 lifeHeart3.visible = NO;            }
            else if (lifeHeart3.visible==NO && lifeHeart2.visible ==YES)
            { lifeHeart2.visible = NO;
            }
            
            else
            {
                NSLog(@"Ball hit bottom!");
                CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO];
                [[CCDirector sharedDirector] replaceScene:gameOverScene];            }
           
            
            
        
            
            //NSLog(@"Ball hit bottom!");
            //CCScene *gameOverScene = [GameOverLayer sceneWithWon:NO];
            //[[CCDirector sharedDirector] replaceScene:gameOverScene];
        }
        
        b2Body *bodyA = contact.fixtureA->GetBody();
        b2Body *bodyB = contact.fixtureB->GetBody();
        if (bodyA->GetUserData() != NULL && bodyB->GetUserData() != NULL) {
            CCSprite *spriteA = (CCSprite *) bodyA->GetUserData();
            CCSprite *spriteB = (CCSprite *) bodyB->GetUserData();
            
            //Sprite A = ball, Sprite B = Block
            if (spriteA.tag == 1 && spriteB.tag == 2) {
                if (std::find(toDestroy.begin(), toDestroy.end(), bodyB) == toDestroy.end()) {
                    toDestroy.push_back(bodyB);
                }
            }
            
            //Sprite A = block, Sprite B = ball
            else if (spriteA.tag == 2 && spriteB.tag == 1) {
                if (std::find(toDestroy.begin(), toDestroy.end(), bodyA) == toDestroy.end()) {
                    toDestroy.push_back(bodyA);
                }
            }
        }
    }
    
    std::vector<b2Body *>::iterator pos2;
    for (pos2 = toDestroy.begin(); pos2 != toDestroy.end(); ++pos2) {
        b2Body *body = *pos2;
        if (body->GetUserData() != NULL) {
            CCSprite *sprite = (CCSprite *) body->GetUserData();
            [self removeChild:sprite cleanup:YES];
        }
        _world->DestroyBody(body);
    }
    
            
        
        }
    


-(void)tick2: (id) sender
{
    
   
    
    
    timeInt--;
    
    
   
    secs = timeInt %30;
    mins = timeInt/60;
    
    

    
    [timer setString:[NSString stringWithFormat:@"%02d", secs]];
    
    
    if (self.timeInt <=0)
    {
        
        [self unschedule:@selector(tick2:)];
        
        
    }
    
}







-(void)dealloc{
    
    delete _world;
    _groundBody = NULL;
    _world = NULL;
    delete _contactListener;
    
 
    [super dealloc];
    
    
}
/*#define kFilteringFactor 0.1
UIAccelerationValue rollingY;
-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
    rollingY = (acceleration.y*kFilteringFactor)+(rollingY*(1.0-kFilteringFactor));
    
    float acelx = -(acceleration.y-rollingY);
    
    float x = acelx*40;
    
    if(self.position.x)
    
}
 */

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
 
	    
    _paddleBody->SetLinearVelocity(b2Vec2(15*acceleration.x,0.0f));

    
    
       
    
   
}

 

    
 




@end
    
