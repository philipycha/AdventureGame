//
//  main.m
//  AdventureGame

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameController *game = [[GameController alloc] init];
        
        [game printPath];
        
        
    }
    return 0;
}
