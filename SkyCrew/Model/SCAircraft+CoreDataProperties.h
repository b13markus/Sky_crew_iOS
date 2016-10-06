//
//  SCAircraft+CoreDataProperties.h
//  
//
//  Created by Yuriy Lubinets on 10/6/16.
//
//

#import "SCAircraft+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SCAircraft (CoreDataProperties)

+ (NSFetchRequest<SCAircraft *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *aircraftId;
@property (nullable, nonatomic, copy) NSString *name;
@property (nullable, nonatomic, retain) SCUser *relationship;

@end

NS_ASSUME_NONNULL_END
