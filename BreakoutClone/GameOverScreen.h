//
//  GameOverScreen.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/1/13.
//
//

#import "cocos2d.h"

@interface GameOverLayer : CCLayerColor

+(CCScene *) sceneWithWon:(BOOL)won;
- (id)initWithWon:(BOOL)won;

@end
