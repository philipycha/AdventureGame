//
//  InputCollector.m
//  AdventureGame
//
//  Created by Philip Ha on 2016-09-07.
//  Copyright © 2016 Cory Alder. All rights reserved.
//

#import "InputCollector.h"

@implementation InputCollector

-(NSString *)inputForPrompt:(NSString *)promptString{
    
    NSLog(@"%@", promptString);
    
    char userInput[50];
    fgets(userInput, 50, stdin);
    NSString *inputSelected = [NSString stringWithUTF8String:userInput];
    
    inputSelected  = [inputSelected stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    
    
    return inputSelected;
    
    
}


@end
