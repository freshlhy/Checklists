//
//  ChecklistsViewController.h
//  Checklists
//
//  Created by freshlhy on 14-2-28.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ItemViewController.h"

@class Checklist;

@interface ChecklistViewController : UITableViewController <ItemViewControllerDelegate>

@property (nonatomic, strong) Checklist *checklist;

@end
