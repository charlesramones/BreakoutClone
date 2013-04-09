//
//  GameOverScreen.m
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/1/13.
//
//

#import "GameOverScreen.h"
#import "cocos2d.h"
#import "GameLayer.h"
#import "MyMenu.h"




@implementation GameOver
+(id)scene
{
    CCScene *scene = [CCScene node];
    
    GameOver *layer = [GameOver node];
    
    [scene addChild:layer];
    
    
    
    return scene;
    
}



-(id)init
{
    if((self = [super initWithColor:ccc4(0, 0, 0, 0)]))
    {
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"GAME OVER!" fontName:@"Arial" fontSize:40];
        title.position = ccp(170, 400);
        [self addChild:title];
        
        
        CCLayer *menuLayer = [[CCLayer alloc]init];
        [self addChild:menuLayer];
        
        
        CCMenuItemFont *retryGameButton = [CCMenuItemFont itemWithString:@"Retry" target:self selector:@selector(Retry)];
        retryGameButton.position = ccp(0, 0);
        
        CCMenuItemFont *mainMenuButton = [CCMenuItemFont itemWithString:@"Main Menu" target:self selector:@selector(Mainmenu)];
        mainMenuButton.position = ccp(0, -50);
        
        
        CCMenu *menu = [CCMenu menuWithItems:retryGameButton, mainMenuButton,  nil];
        [menuLayer addChild: menu];
        
    
    
        
    }
    return self;
}

-(void)Retry
{
    [[CCDirector sharedDirector]replaceScene:[GameLayer scene]];
}

-(void)Mainmenu
{
    [[CCDirector sharedDirector]replaceScene:[MyMenu scene]];
}

-(void)dealloc
{
    [super dealloc];
}

@end
