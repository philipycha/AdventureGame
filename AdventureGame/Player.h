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

@property (nonatomic) NSInteger health;
@property (nonatomic) NSInteger wealth;
@property (nonatomic) NSInteger distanceMoved;

@property (nonatomic, strong) PathSegment *currentPosition;

-(instancetype)init;

@end
