//
//  Checklist.h
//  Checklists
//
//  Created by freshlhy on 3/10/14.
//  Copyright (c) 2014 freshlhy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Checklist : NSObject <NSCoding>

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *iconName;

@property (nonatomic, strong) NSMutableArray *items;

- (int)countUncheckedItems;

@end
