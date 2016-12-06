//
//  AppDelegate.h
//  DCStore
//
//  Created by Eli MArshall on 12/5/16.
//  Copyright © 2016 Eli MArshall. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <Moltin/Moltin.h>
#import "MFSideMenu.h"
#import "CategoriesViewController.h"
#import "CartViewController.h"
#import "NavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

