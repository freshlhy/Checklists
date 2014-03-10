//
//  ItemViewController.h
//  Checklists
//
//  Created by freshlhy on 14-3-1.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ItemDetailViewController;
@class ChecklistItem;

@protocol ItemDetailViewControllerDelegate <NSObject>

- (void)itemDetailViewControllerDidCancel: (ItemDetailViewController *)controller;

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishAddingItem:(ChecklistItem *)item;

- (void)itemDetailViewController:(ItemDetailViewController *)controller didFinishEditingItem:(ChecklistItem *)item;

@end

@interface ItemDetailViewController : UITableViewController <UITextFieldDelegate>

@property (nonatomic, weak) id <ItemDetailViewControllerDelegate> delegate;
@property (nonatomic, weak) ChecklistItem *itemToEdit;

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *doneBarButton;

- (IBAction)cancel;
- (IBAction)done;

@end
