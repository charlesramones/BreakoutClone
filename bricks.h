//
//  bricks.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"
#import "Box2D.h"
#import "MainController.h"
#define PTM_RATIO 32.0




@interface bricks : CCLayer {
    
    
    
 
    b2BodyDef block3BodyDef;
    b2BodyDef block2BodyDef;
    b2BodyDef blockBodyDef;
    CCSprite *block;
    CCSprite *block2;
    CCSprite *block3;
    
    
  
    
    
   
    
}

-(bricks*)initWithWorld:(b2World*)world;

@property(nonatomic)b2BodyDef*blockBodyDef;
@property(nonatomic)b2BodyDef *block2BodyDef;
@property(nonatomic)b2BodyDef *block3BodyDef;

@property(nonatomic, strong)CCSprite*block;
@property(nonatomic, strong)CCSprite*block2;
@property(nonatomic, strong)CCSprite*block3;


@end
