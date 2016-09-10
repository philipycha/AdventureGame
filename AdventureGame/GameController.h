//
//  GameController.h
//  AdventureGame


#import <Foundation/Foundation.h>
#import "PathSegment.h"
#import "Player.h"
#import "InputCollector.h"
#import "PathSegmentContent.h"

typedef NS_ENUM(NSInteger, MovementDirection) {
    MovementDirectionMain,
    MovementDirectionSide
};

@interface GameController : NSObject

@property (nonatomic, strong) PathSegment *start;
@property (nonatomic, strong) Player *player;

-(void)printPath;
-(void)playerStatus;
-(void)askPlayerMove;
-(void)movePlayerMainPath;
-(void)movePlayerSideBranch;

-(BOOL)playerAlive;
-(BOOL)playerWin;

-(void)lineSpace;

-(NSInteger)getDistanceMoved;
-(NSInteger)getWealth;
-(NSInteger)getHealth;


@end
