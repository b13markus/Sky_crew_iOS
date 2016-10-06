//
//  SCAircraft+CoreDataProperties.m
//  
//
//  Created by Yuriy Lubinets on 10/6/16.
//
//

#import "SCAircraft+CoreDataProperties.h"

@implementation SCAircraft (CoreDataProperties)

+ (NSFetchRequest<SCAircraft *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SCAircraft"];
}

@dynamic aircraftId;
@dynamic name;
@dynamic relationship;

@end
