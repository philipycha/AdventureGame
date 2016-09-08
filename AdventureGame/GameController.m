//
//  GameController.m
//  AdventureGame


#import "GameController.h"

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        // generate game path
        
        _start = [self generatePath];
        _player = [[Player alloc] init];
        
    }
    return self;
}



-(PathSegment *)generatePath {
    
    PathSegment *home = [[PathSegment alloc] initWithContent:nil];
    
    PathSegment *mainBranchCursor = home; // primary
    PathSegment *sideBranchCursor = nil;
    
    for (int i = 0; i < 100; i++) {
        
        PathSegmentContent *randContent = [self randomContent];
        
        if (mainBranchCursor != nil) {
            // append to main branch
            mainBranchCursor.mainRoad = [[PathSegment alloc] initWithContent:randContent];
            mainBranchCursor = mainBranchCursor.mainRoad;
        }
        
        if (sideBranchCursor != nil) {
            // append to side branch
            sideBranchCursor.sideBranch = [[PathSegment alloc] initWithContent:randContent];
            sideBranchCursor = sideBranchCursor.sideBranch;
        }
        
        if (mainBranchCursor && sideBranchCursor) {
            // if we're branched right now, maybe merge.
            if (arc4random_uniform(10) < 3) {
                sideBranchCursor.mainRoad = mainBranchCursor;
                sideBranchCursor = nil;
            }
        } else {
            // if we're not branched right now, maybe split.
            if (arc4random_uniform(10) < 3) {
                sideBranchCursor = mainBranchCursor;
            }
        }
    }
    
    return home;
}


-(PathSegmentContent *)randomContent {
    return nil;
}


-(void)printPath {
    
    PathSegment *mainPath = self.start.mainRoad;
    PathSegment *sidePath = self.start.sideBranch;
    
    while (mainPath.mainRoad != NULL) {
        [self printMainPath:mainPath andSide:sidePath];
        
        printf("\n");
        mainPath = mainPath.mainRoad;
        
        if (mainPath.sideBranch) {
            sidePath = mainPath.sideBranch;
        } else if (sidePath) {
            sidePath = sidePath.sideBranch;
        }
    }
}


-(void)printMainPath:(PathSegment *)main andSide:(PathSegment *)side {
    if (!main) return;
    
    if (main.mainRoad && main.sideBranch) {
        printf("|\\");
    } else {
        if (main.mainRoad) {
            printf("|");
        }
        
        if (side) {
            if (side.sideBranch) {
                printf(" |");
            } else {
                printf("/");
            }
        }
    }
}

-(void)playerStatus{
    
    NSInteger health = self.player.health;
    NSInteger wealth = self.player.wealth;
    NSInteger distanceMoved = self.player.distanceMoved;
    
    NSLog(@"\n Health %ld --- Wealth %ld --- Distance Travelled %ld\n", health, wealth, distanceMoved);
    
    if (self.player.currentPosition != nil) {
        if (self.player.currentPosition.mainRoad != nil && self.player.currentPosition.sideBranch != nil) {
            NSLog(@"you can move down the main road or the side branch");
        }
        if (self.player.currentPosition.mainRoad != nil) {
            NSLog(@"you can move down the main road");
        }
        if (self.player.currentPosition.sideBranch != nil) {
             NSLog(@"you can move down the side branch");
        }
    }
    
    
}

-(NSInteger)getHealth {
    
    return self.player.health;
    
}

-(NSInteger)getWealth {
    
    return self.player.wealth;
    
}


-(NSInteger)getDistanceMoved {
    
    return self.player.distanceMoved;
    
}





@end
