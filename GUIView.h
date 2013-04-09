//
//  GUIView.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//  Copyright 2013 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface GUIView : CCLayer {
    
    CCLabelTTF *timer;
    CCLabelTTF *livesLabel;
    CCSprite *lifeHeart1;
    CCSprite *lifeHeart2;
    CCSprite *lifeHeart3;
    CCSprite *powerUp;
    CCLabelTTF *powerUpLabel;
    CCLabelTTF *pause;
    CCLabelTTF *scoreLabel;
}
@property(nonatomic, strong)CCLabelTTF *timer;
@property(nonatomic, strong)CCLabelTTF *livesLabel;
@property(nonatomic, strong)CCSprite *lifeHeart1;
@property(nonatomic, strong)CCSprite *lifeHeart2;
@property(nonatomic, strong)CCSprite *lifeHeart3;
@property(nonatomic, strong)CCSprite *powerUp;
@property(nonatomic, strong)CCLabelTTF *powerUpLabel;
@property(nonatomic, strong)CCLabelTTF *pause;
@property(nonatomic, strong)CCLabelTTF *scoreLabel;


@end
