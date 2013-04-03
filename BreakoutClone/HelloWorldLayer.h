//
//  HelloWorldLayer.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 3/27/13.
//  Copyright __MyCompanyName__ 2013. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"
#import "Box2D.h"
#import "MyContactListener.h"
#define kNumBonus 15





//Pixel to metres ratio. Box2D uses metres as the unit for measurement.
//This ratio defines how many pixels correspond to 1 Box2D "metre"
//Box2D is optimized for objects of 1x1 metre therefore it makes sense
//to define the ratio so that your most common object type is 1x1 metre.
#define PTM_RATIO 32.0

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
    b2World*_world;
    b2Body *_groundBody;
    b2Fixture *_bottomFixture;
    b2Fixture *_ballFixture;
    b2Body *_paddleBody;
    b2Fixture *_paddleFixture;
    float _paddlePointsPerSec;
    MyContactListener *_contactListener;
    CCLabelTTF *timer;
    int timeInt;
    int secs;
    int mins;
    NSString *totalTimeString;
    int lives;
    CCLabelTTF *livesLabel;
   
    NSString *livesString;
    CCSprite *lifeHeart1;
    CCSprite *lifeHeart2;
    CCSprite *lifeHeart3;
    
    int counterForLifeHeart;    
    CCSprite *paddle;
    
    CCArray *bonus;
    int nextBonus;
    double nextBonusSpawn;
    
    
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(id) scene;
-(void) kick;
@property (nonatomic, assign)int timeInt;
@property (nonatomic, assign)int secs;
@property (nonatomic, assign)int mins;
@property (nonatomic, retain)NSString *totalTimeString;
@property(nonatomic, assign)int lives;
@property (nonatomic, retain)NSString *livesString;

@end
