//
//  AppDelegate.h
//  CoreData
//
//  Created by USER on 9/23/19.
//  Copyright © 2019 USER. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentStoreCoordinator* persistentStoreCoordinator;
@property (readonly, strong) NSManagedObjectContext* managedObjectContext;
@property (readonly, strong) NSManagedObjectModel* managedObjectModel;

- (void)saveContext;

@end

