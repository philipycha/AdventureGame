//
//  Player.h
//  AdventureGame
//
//  Created by Philip Ha on 2016-09-07.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PathSegment.h"

@interface Player : NSObject

@property (nonatomic, assign) int health;
@property (nonatomic, assign) int wealth;

@property (nonatomic, strong) PathSegment *currentPosition;

@end
