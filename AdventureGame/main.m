//
//  main.m
//  AdventureGame

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        GameController *game = [[GameController alloc] init];
        
        [game printPath];
        
        
        while (YES) {
            
            [game playerStatus];
            
            if ([game playerWin]) {
                NSLog(@"YOU WON! CONGRATULATIONS!");
                break;
                
            }
            
            if (![game playerAlive]) {
                NSLog(@"You DIED!!!");
                break;
                
            }
            
            [game askPlayerMove];
            
            
            
        }
        
    }
    return 0;
}
