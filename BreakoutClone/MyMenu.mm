//
//  MyMenu.m
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/5/13.
//
//

#import "MyMenu.h"
#import "cocos2d.h"
#import "GameLayer.h"
#import "ScoreScene.h"


@implementation MyMenu


+(id)scene
{
    CCScene *scene = [CCScene node];
    
    MyMenu *layer = [MyMenu node];
    
    [scene addChild:layer];
    
    
    
    return scene;
    
}



-(id)init
{
    if((self = [super initWithColor:ccc4(1, 245, 376, 56)]))
    {
        
        CCLabelTTF *title = [CCLabelTTF labelWithString:@"BreakBricks" fontName:@"Marker Felt" fontSize:40];
        title.position = ccp(170, 400);
        [self addChild:title];
        
        
        CCLayer *menuLayer = [[CCLayer alloc]init];
        [self addChild:menuLayer];
        
        
        
        [CCMenuItemFont setFontName:@"Marker Felt"];
        
        
        /*CCMenuItemImage *startButton = [CCMenuItemImage itemWithNormalImage:@"1.png" selectedImage:nil target:self selector:@selector(startButton:)];
         
         startButton.position = ccp(0, 0);
         
         CCMenuItemImage *MediumButton = [CCMenuItemImage itemWithNormalImage:@"1.png" selectedImage:nil target:self selector:@selector(MediumButton:)];
         
         startButton.position = ccp(0, -50);
         
         CCMenuItemImage *About = [CCMenuItemImage itemWithNormalImage:@"1.png" selectedImage:nil target:self selector:@selector(About:)];
         
         About.position = ccp(0, -100);*/
        
        CCMenuItemFont *startGameButton = [CCMenuItemFont itemWithString:@"Start Game" target:self selector:@selector(startButton)];
        startGameButton.position = ccp(0, 0);
        
        CCMenuItemFont *scoreButton = [CCMenuItemFont itemWithString:@"High Scores" target:self selector:@selector(ScoreButton)];
        scoreButton.position = ccp(0, -50);
        
        /*CCMenuItemFont *aboutGameButton = [CCMenuItemFont itemWithString:@"About" target:self selector:@selector(About)];
        aboutGameButton.position = ccp(0, -100);
        //[menuLayer addChild:scoreButton];*/
        
        CCMenu *menu = [CCMenu menuWithItems:startGameButton, scoreButton, nil];
        [menuLayer addChild: menu];
        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		
		// Register default high scores - this could be more easily done by loading a .plist instead of manually creating this nested object
		NSDictionary *defaultDefaults = [NSDictionary dictionaryWithObject:[NSArray arrayWithObjects:[NSNumber numberWithInt:0],
																			[NSNumber numberWithInt:0],
																			[NSNumber numberWithInt:0],
																			[NSNumber numberWithInt:0],
																			[NSNumber numberWithInt:0],
																			nil]
																	forKey:@"scores"];
		[defaults registerDefaults:defaultDefaults];
		[defaults synchronize];
        
        
        
        
    }
    
    
    
    return self;
}


-(void) startButton
{
    
    [[CCDirector sharedDirector]replaceScene:[GameLayer scene]];
    
}

-(void) ScoreButton
{
    
    [[CCDirector sharedDirector]replaceScene:[ScoreLayer scene]];
    
}



@end
