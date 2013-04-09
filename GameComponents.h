//
//  GameComponents.h
//  BreakoutClone
//
//  Created by Charles Marlon G. Ramones on 4/8/13.
//
//

#import <Foundation/Foundation.h>

@interface GameComponents : NSObject

{

int timeInt;
int secs;
int mins;
NSString *totalTimeString;
NSString *livesString;
int powerUpInt;
NSString *powerUpString;
int score;
NSString *scoreString;
int counterInt;
int seconds;
}
@property (nonatomic, assign)int timeInt;
@property (nonatomic, assign)int secs;
@property (nonatomic, assign)int mins;
@property (nonatomic, retain)NSString *totalTimeString;
@property(nonatomic, assign)int lives;
@property (nonatomic, retain)NSString *livesString;



@end
