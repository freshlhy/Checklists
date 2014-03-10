//
//  ChecklistsViewController.m
//  Checklists
//
//  Created by freshlhy on 14-2-28.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import "ChecklistViewController.h"
#import "ChecklistItem.h"
#import "Checklist.h"

@interface ChecklistViewController ()

@end

@implementation ChecklistViewController

{
    NSMutableArray *_items;
}

- (NSString *)documentsDirectory {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths firstObject];
    return documentsDirectory;
}

- (NSString *)dataFilePath {
    return [[self documentsDirectory] stringByAppendingPathComponent:@"Checklists.plist"];
}

- (void)saveChecklistItems {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:_items forKey:@"ChecklistItems"];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];
}

- (void)loadChecklistItems {
    NSString *path = [self dataFilePath];
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        NSData *data = [[NSData alloc] initWithContentsOfFile:path];
        NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        
        _items = [unarchiver decodeObjectForKey:@"ChecklistItems"];
        [unarchiver finishDecoding];
    } else {
        _items = [[NSMutableArray alloc] initWithCapacity:20];
    }
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder])) {
        [self loadChecklistItems];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = self.checklist.name;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_items count];
}

- (void)configureCheckmarkForCell:(UITableViewCell *)cell
                withChecklistItem:(ChecklistItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1001];
    if (item.checked) {
        label.text = @"√";
    } else {
        label.text = @" ";
    }
}

- (void)configureTextForCell:(UITableViewCell *)cell
           withChecklistItem:(ChecklistItem *)item
{
    UILabel *label = (UILabel *)[cell viewWithTag:1000];
    label.text = item.text;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChecklistItem"];
    
    ChecklistItem *item = _items[indexPath.row];
    
    [self configureTextForCell:cell withChecklistItem:item];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    
    ChecklistItem *item = _items[indexPath.row];
    [item toggleChecked];
    
    [self configureCheckmarkForCell:cell withChecklistItem:item];
    
    [self saveChecklistItems];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

// delete

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [_items removeObjectAtIndex:indexPath.row];
    
    [self saveChecklistItems];
    
    NSArray *indexPaths = @[indexPath];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
}


// segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    UINavigationController *navigationController = segue.destinationViewController;
    
    ItemViewController *controller = (ItemViewController *)navigationController.topViewController;
    
    
    if ([segue.identifier isEqualToString:@"AddItem"]) {
        
        controller.delegate = self;
    }
    
    if ([segue.identifier isEqualToString:@"EditItem"]) {
        
        controller.delegate = self;
        
        NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
        controller.itemToEdit = _items[indexPath.row];
        
    }
}

- (void)itemViewControllerDidCancel:(ItemViewController *)controller {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)addItem:(ChecklistItem *)item {
    
    NSInteger newRowIndex = [_items count];
    
    [_items addObject:item];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:newRowIndex inSection:0];
    NSArray *indexPaths = @[indexPath];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

- (void)itemViewController:(ItemViewController *)controller didFinishAddingItem:(ChecklistItem *)item {
    
    [self addItem:item];
    
    [self saveChecklistItems];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

// editing existing checklist items

- (void)itemViewController:(ItemViewController *)controller didFinishEditingItem:(ChecklistItem *)item {
    
    NSInteger index = [_items indexOfObject:item];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    
    [self configureTextForCell:cell withChecklistItem:item];
    
    [self saveChecklistItems];

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
