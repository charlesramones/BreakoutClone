//
//  PauseScreen.m
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//
//

#import "PauseScreen.h"

@implementation PauseLayer


- (id) initWithColor:(ccColor4B)color
{
    if ((self = [super initWithColor:color]))
    {
        
        self.isTouchEnabled=YES;
        
        CCLabelTTF *paused = [CCLabelTTF labelWithString:@"Paused" fontName:@"Marker Felt" fontSize:23.0];
        
        [paused setPosition:ccp(160,240)];
        [self addChild:paused];
        
    }
    return self;
}



- (void)ccTouchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    for( UITouch *touch in touches )
    {
        CGPoint location = [touch locationInView: [touch view]];
        
        location = [[CCDirector sharedDirector] convertToGL: location];
        
        GameLayer * gl = (GameLayer *)[self.parent getChildByTag:KGameLayer];
        [gl resume];
        [self.parent removeChild:self cleanup:YES];
    }
}

- (void) dealloc
{
    [super dealloc];
}

@end
