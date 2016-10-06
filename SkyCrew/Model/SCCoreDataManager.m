//
//  SCCoreDataManager.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 10/6/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCCoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "SCUser+CoreDataProperties.h"
#import "SCAircraft+CoreDataProperties.h"

@implementation SCCoreDataManager

+ (SCCoreDataManager *)sharedManager {
    static SCCoreDataManager* manager = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SCCoreDataManager alloc]init];
    });

    return manager;
}

- (void)createUserWithUserInfo:(NSDictionary *)infoDictionary {
    
    SCUser* user = [SCUser MR_createEntity];
    NSLog(@"!!!!!!!!!!!!!!%@", infoDictionary);
    
    user.userId = [infoDictionary objectForKey:@"id"];
    user.userKey = [infoDictionary objectForKey:@"userKey"];
    user.firstName = [infoDictionary objectForKey:@"firstName"];
    user.lastName = [infoDictionary objectForKey:@"lastName"];
    user.email = [infoDictionary objectForKey:@"email"];
    user.photoUrl = [infoDictionary objectForKey:@"photoUrl"];
    user.thumbnailUrl = [infoDictionary objectForKey:@"thumbnailUrl"];
    user.aboutMe = [infoDictionary objectForKey:@"aboutMe"];
    user.isAirlineMember = [infoDictionary objectForKey:@"isAirlineMember"];
    user.type = [infoDictionary objectForKey:@"type"];
    user.activated = [infoDictionary objectForKey:@"activated"];
    user.status = [infoDictionary objectForKey:@"status"];
    user.icao = [infoDictionary objectForKey:@"icao"];
    user.iata = [infoDictionary objectForKey:@"iata"];
    user.cpUsername = [infoDictionary objectForKey:@"cpUsername"];
    user.cpPassword = [infoDictionary objectForKey:@"cpPassword"];
    user.airlines = [infoDictionary objectForKey:@"airlines"];
    user.airport = [infoDictionary objectForKey:@"airport"];
    user.city = [infoDictionary objectForKey:@"city"];
    user.airportCountry = [infoDictionary objectForKey:@"airportCountry"];
    user.airportTimezone = [infoDictionary objectForKey:@"airportTimezone"];
    user.countryCode = [infoDictionary objectForKey:@"countryCode"];
    user.currencyName = [infoDictionary objectForKey:@"currencyName"];
    user.currencyCode = [infoDictionary objectForKey:@"currencyCode"];
    user.rosterFiletype = [infoDictionary objectForKey:@"rosterFiletype"];
    user.cpAirlineIata = [infoDictionary objectForKey:@"cpAirlineIata"];
    user.cpRosterTimetype = [infoDictionary objectForKey:@"cpRosterTimetype"];
    user.cpRosterDatetimeFormat = [infoDictionary objectForKey:@"cpRosterDatetimeFormat"];
    user.rosterDatetimeFormatJava = [infoDictionary objectForKey:@"rosterDatetimeFormatJava"];
    user.landingPageUrl = [infoDictionary objectForKey:@"landingPageUrl"];
    user.landingPageId = [infoDictionary objectForKey:@"landingPageId"];
    user.memoParser = [infoDictionary objectForKey:@"memoParser"];
    user.jobPosition = [infoDictionary objectForKey:@"jobPosition"];
    user.deadline = [infoDictionary objectForKey:@"deadline"];
    user.period = [infoDictionary objectForKey:@"period"];
    user.flightStatus = [infoDictionary objectForKey:@"flightStatus"];
    user.airportCity = [infoDictionary objectForKey:@"airportCity"];
    user.cpUrl = [infoDictionary objectForKey:@"cpUrl"];
    user.canAutoLogin = [infoDictionary objectForKey:@"canAutoLogin"];
    user.canParseRoster = [infoDictionary objectForKey:@"canParseRoster"];
    user.canParseMemo = [infoDictionary objectForKey:@"canParseMemo"];
    user.importStatus = [infoDictionary objectForKey:@"importStatus"];
    user.autoImportStatus = [infoDictionary objectForKey:@"autoImportStatus"];
    NSArray *arrayWithAircrafts = [infoDictionary objectForKey:@"aircraft"];
    NSMutableSet *setWithAircrafts = [[NSMutableSet alloc]init];
    for (NSDictionary *dict in arrayWithAircrafts) {
        
        SCAircraft* aircraft = [SCAircraft MR_createEntity];
        aircraft.aircraftId = [dict objectForKey:@"id"];
        aircraft.name = [dict objectForKey:@"name"];
        [setWithAircrafts addObject:aircraft];
    }
    [user addAircraft:[setWithAircrafts copy]];
    
    NSManagedObjectContext *context = user.managedObjectContext;
    [context MR_saveToPersistentStoreAndWait];
}
@end
