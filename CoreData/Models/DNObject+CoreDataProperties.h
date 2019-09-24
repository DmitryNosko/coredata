//
//  DNObject+CoreDataProperties.h
//  CoreData
//
//  Created by USER on 9/24/19.
//  Copyright © 2019 USER. All rights reserved.
//
//

#import "DNObject+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface DNObject (CoreDataProperties)

+ (NSFetchRequest<DNObject *> *)fetchRequest;


@end

NS_ASSUME_NONNULL_END
