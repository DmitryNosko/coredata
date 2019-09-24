//
//  AppDelegate.m
//  CoreData
//
//  Created by USER on 9/23/19.
//  Copyright © 2019 USER. All rights reserved.
//

#import "AppDelegate.h"
#import "Student+CoreDataClass.h"
#import "University+CoreDataClass.h"
#import "DNObject+CoreDataClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize managedObjectModel = _managedObjectModel;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

//    University* un = [self addUniversityWithName:@"BNTU"];
//
//    for (int i = 0; i < 10; i++) {
//        Student* student = [self addStudentWithFirstName:[NSString stringWithFormat:@"Dima%@", @(i)] lastName:[NSString stringWithFormat:@"Nosko%@", @(i)] score:9];
//        student.university = un;
//    }
    
    
    
    
    
    [self printAllObjects];
    
    return YES;
}

- (void) deleteAllObjects {
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setResultType:NSDictionaryResultType];
    NSEntityDescription* description = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSArray<Student *>* resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    for (Student* st in resultArray) {
        [self.managedObjectContext deleteObject:st];
    }
    [self.managedObjectContext save:nil];
}

- (void) printAllObjects {
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setResultType:NSDictionaryResultType];
    NSEntityDescription* description = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSArray<Student *>* resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    
//    for (Student* obj in [resultArray copy]) {
//        NSLog(@"obj = %@", [obj valueForKey:@"university"]);
//    }
    
    NSLog(@"arr = %@", resultArray);
}

- (University *) addUniversityWithName:(NSString *) name {
    University* univercity = [NSEntityDescription insertNewObjectForEntityForName:@"University" inManagedObjectContext:self.managedObjectContext];
    [univercity setValue:name forKey:@"name"];
    
//    NSError* error = nil;
//    if (![self.managedObjectContext save:&error]) {
//        NSLog(@"error = %@", error);
//    }
    return univercity;
}

- (Student *) addStudentWithFirstName:(NSString *) firstName lastName:(NSString *) lastName score:(double) score  {
    Student* student = [NSEntityDescription insertNewObjectForEntityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
    [student setValue:firstName forKey:@"firstName"];
    [student setValue:lastName forKey:@"lastName"];
    
//    NSError* error = nil;
//    if (![self.managedObjectContext save:&error]) {
//        NSLog(@"error = %@", error);
//    }
    return student;
}

- (void) deleteAllStudent {
    NSFetchRequest* request = [[NSFetchRequest alloc] init];
    [request setResultType:NSManagedObjectResultType];
    NSEntityDescription* description = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:self.managedObjectContext];
    [request setEntity:description];
    
    NSArray<Student *>* resultArray = [self.managedObjectContext executeFetchRequest:request error:nil];
    
    for (Student* st in resultArray) {
        NSManagedObjectID* stID = [st objectID];
        id obj = [self.managedObjectContext existingObjectWithID:stID error:nil];
        [self.managedObjectContext deleteObject:obj];
    }
    [self.managedObjectContext save:nil];
}

#pragma mark - Setters Getters

- (NSManagedObjectContext *)managedObjectContext {
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator* coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    
    return _managedObjectContext;
}


- (NSManagedObjectModel *)managedObjectModel {
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    
    NSURL* modelURL = [[NSBundle mainBundle] URLForResource:@"CoreData" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL* storeURL = [[self applicationDocumentDirectory] URLByAppendingPathComponent:@"CoreData.sqlite"];
    
    NSError* error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
//        [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil];
//        [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error];
    }
    
    return _persistentStoreCoordinator;
}

- (NSURL *) applicationDocumentDirectory {
    NSArray *paths = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask];
    return [paths lastObject];
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.managedObjectContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
