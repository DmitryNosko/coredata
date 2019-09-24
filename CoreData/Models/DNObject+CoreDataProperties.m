//
//  DNObject+CoreDataProperties.m
//  CoreData
//
//  Created by USER on 9/24/19.
//  Copyright © 2019 USER. All rights reserved.
//
//

#import "DNObject+CoreDataProperties.h"

@implementation DNObject (CoreDataProperties)

+ (NSFetchRequest<DNObject *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"DNObject"];
}


@end
