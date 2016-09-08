//
//  GameController.h
//  AdventureGame


#import <Foundation/Foundation.h>
#import "PathSegment.h"

typedef NS_ENUM(NSInteger, MovementDirection) {
    MovementDirectionMain,
    MovementDirectionSide
};

@interface GameController : NSObject

@property (nonatomic, strong) PathSegment *start;

-(void)printPath;

@end
