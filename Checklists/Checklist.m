//
//  Checklist.m
//  Checklists
//
//  Created by freshlhy on 3/10/14.
//  Copyright (c) 2014 freshlhy. All rights reserved.
//

#import "Checklist.h"

@implementation Checklist

- (id)init {
    if ((self = [super init])) {
        self.items = [[NSMutableArray alloc] initWithCapacity:20];
    }
    return self;
}

@end
