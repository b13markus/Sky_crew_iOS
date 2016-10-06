//
//  SCUser+CoreDataProperties.m
//  
//
//  Created by Yuriy Lubinets on 10/6/16.
//
//

#import "SCUser+CoreDataProperties.h"

@implementation SCUser (CoreDataProperties)

+ (NSFetchRequest<SCUser *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"SCUser"];
}

@dynamic aboutMe;
@dynamic activated;
@dynamic email;
@dynamic firstName;
@dynamic isAirlineMember;
@dynamic lastName;
@dynamic photoUrl;
@dynamic status;
@dynamic thumbnailUrl;
@dynamic type;
@dynamic userId;
@dynamic userKey;
@dynamic icao;
@dynamic iata;
@dynamic cpUsername;
@dynamic cpPassword;
@dynamic airlines;
@dynamic airport;
@dynamic city;
@dynamic airportCountry;
@dynamic airportTimezone;
@dynamic countryCode;
@dynamic currencyName;
@dynamic currencyCode;
@dynamic rosterFiletype;
@dynamic cpAirlineIata;
@dynamic cpRosterTimetype;
@dynamic cpRosterDatetimeFormat;
@dynamic rosterDatetimeFormatJava;
@dynamic landingPageUrl;
@dynamic landingPageId;
@dynamic memoParser;
@dynamic jobPosition;
@dynamic deadline;
@dynamic period;
@dynamic flightStatus;
@dynamic airportCity;
@dynamic cpUrl;
@dynamic canAutoLogin;
@dynamic canParseRoster;
@dynamic canParseMemo;
@dynamic importStatus;
@dynamic autoImportStatus;
@dynamic aircraft;

@end
