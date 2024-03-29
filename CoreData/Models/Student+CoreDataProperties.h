//
//  Student+CoreDataProperties.h
//  CoreData
//
//  Created by USER on 9/24/19.
//  Copyright © 2019 USER. All rights reserved.
//
//

#import "Student+CoreDataClass.h"
#import "University+CoreDataClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface Student (CoreDataProperties)

+ (NSFetchRequest<Student *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *firstName;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nonatomic) double score;
@property (nullable, nonatomic, retain) University *university;

@end

NS_ASSUME_NONNULL_END
