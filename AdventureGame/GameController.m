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

@end
