//
//  PathSegmentContent.h
//  AdventureGame
//
//  Created by Philip Ha on 2016-09-10.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Player.h"

@interface PathSegmentContent : NSObject

@property (nonatomic, assign) BOOL treasure;
@property (nonatomic, assign) BOOL goblin;
@property (nonatomic, assign) BOOL nothing;

@end
