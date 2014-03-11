//
//  AllListsViewController.h
//  Checklists
//
//  Created by freshlhy on 3/9/14.
//  Copyright (c) 2014 freshlhy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListDetailViewController.h"

@class DataModel;

@interface AllListsViewController : UITableViewController <ListDetailViewControllerDelegate>

@property (nonatomic, strong) DataModel *dataModel;

@end
