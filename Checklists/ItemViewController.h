//
//  ItemViewController.h
//  Checklists
//
//  Created by freshlhy on 14-3-1.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemViewController;
@class ChecklistItem;

@protocol ItemViewControllerDelegate <NSObject>

- (void)itemViewControllerDidCancel: (ItemViewController *)controller;

- (void)itemViewController:(ItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

- (void)itemViewController:(ItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <ItemViewControllerDelegate> delegate;
@property (nonatomic, weak) ChecklistItem *itemToEdit;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)cancel;
- (IBAction)done;

@end
