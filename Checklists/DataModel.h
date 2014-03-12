//
//  DataModel.h
//  Checklists
//
//  Created by freshlhy on 14-3-11.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

@property (nonatomic, strong)NSMutableArray *lists;

- (void)saveChecklists;
- (void)sortChecklists;
- (NSInteger)indexOfSelectedChecklist;
- (void)setIndexOfSelectedChecklist:(NSInteger)index;

@end
