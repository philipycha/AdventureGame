//
//  Player.m
//  AdventureGame
//
//  Created by Philip Ha on 2016-09-07.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import "Player.h"

@implementation Player

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _health = 100;
        _wealth = 0;
        _distanceMoved = 0;
        //haven't included method to increment distance moved yet
        
    return self;
}
    
    return nil;
}

@end
