//
//  ChecklistItem.m
//  Checklists
//
//  Created by freshlhy on 14-3-1.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import "ChecklistItem.h"

@implementation ChecklistItem

- (id)init
{
    self = [super init];
    if (self) {
        self.checked = YES;
    }
    return self;
}

- (void)toggleChecked {
    self.checked = !self.checked;
}

@end
