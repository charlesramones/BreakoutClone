//
//  PauseScreen.m
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/5/13.
//
//

#import "PauseScreen.h"
#import "MyMenu.h"
#import "HelloWorldLayer.h"

@implementation PauseScreen


+(id)scene
{
    CCScene *scene = [CCScene node];
    
    PauseScreen *layer = [PauseScreen node];
    
    [scene addChild:layer];
    
    
    
    return scene;
    
}



-(id)init
{
    if((self = [super initWithColor:ccc4(1, 245, 376, 56)]))
    {
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"Pause" fontName:@"Marker Felt" fontSize:40];
        title.position = ccp(170, 400);
        [self addChild:title];
        
        
        CCLayer *menuLayer = [[CCLayer alloc]init];
        [self addChild:menuLayer];
        
        
        
        [CCMenuItemFont setFontName:@"Courier"];
        
        
        /*CCMenuItemImage *startButton = [CCMenuItemImage itemWithNormalImage:@"1.png" selectedImage:nil target:self selector:@selector(startButton:)];
         
         startButton.position = ccp(0, 0);
         
         CCMenuItemImage *MediumButton = [CCMenuItemImage itemWithNormalImage:@"1.png" selectedImage:nil target:self selector:@selector(MediumButton:)];
         
         startButton.position = ccp(0, -50);
         
         CCMenuItemImage *About = [CCMenuItemImage itemWithNormalImage:@"1.png" selectedImage:nil target:self selector:@selector(About:)];
         
         About.position = ccp(0, -100);*/
        
        CCMenuItemFont *startGameButton = [CCMenuItemFont itemWithString:@"Resume" target:self selector:@selector(startButton)];
        startGameButton.position = ccp(0, 0);
        
        CCMenuItemFont *scoreButton = [CCMenuItemFont itemWithString:@"Quit" target:self selector:@selector(ScoreButton)];
        scoreButton.position = ccp(0, -50);
        
        
        
        CCMenu *menu = [CCMenu menuWithItems:startGameButton, scoreButton,  nil];
        [menuLayer addChild: menu];
        
        
               
        
    }
    return self;
}



-(void) startButton
{
    
    [self resumeSchedulerAndActions];
    for (CCNode *child in [self children]) {
        [child resumeSchedulerAndActions];
        
    }
}

-(void) ScoreButton
{
    
    [[CCDirector sharedDirector]replaceScene:[MyMenu scene]];
    
}



-(void)dealloc
{
    [super dealloc];
    
}


@end


