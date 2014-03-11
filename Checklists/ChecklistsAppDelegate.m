//
//  ChecklistsAppDelegate.m
//  Checklists
//
//  Created by freshlhy on 14-2-28.
//  Copyright (c) 2014年 freshlhy. All rights reserved.
//

#import "ChecklistsAppDelegate.h"
#import "AllListsViewController.h"
#import "DataModel.h"

@implementation ChecklistsAppDelegate
{
    DataModel *_dataModel;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _dataModel = [[DataModel alloc] init];
    
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    
    AllListsViewController *controller = navigationController.viewControllers[0];
    
    controller.dataModel = _dataModel;
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)saveData {
    [_dataModel saveChecklists];
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    [self saveData];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    [self saveData];
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
