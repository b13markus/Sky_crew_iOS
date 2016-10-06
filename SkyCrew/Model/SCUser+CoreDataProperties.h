//
//  SCUser+CoreDataProperties.h
//  
//
//  Created by Yuriy Lubinets on 10/6/16.
//
//

#import "SCUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface SCUser (CoreDataProperties)

+ (NSFetchRequest<SCUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *aboutMe;
@property (nonatomic) BOOL activated;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *firstName;
@property (nonatomic) BOOL isAirlineMember;
@property (nullable, nonatomic, copy) NSString *lastName;
@property (nullable, nonatomic, copy) NSString *photoUrl;
@property (nullable, nonatomic, copy) NSString *status;
@property (nullable, nonatomic, copy) NSString *thumbnailUrl;
@property (nullable, nonatomic, copy) NSString *type;
@property (nullable, nonatomic, copy) NSNumber *userId;
@property (nullable, nonatomic, copy) NSString *userKey;
@property (nullable, nonatomic, copy) NSString *icao;
@property (nullable, nonatomic, copy) NSString *iata;
@property (nullable, nonatomic, copy) NSString *cpUsername;
@property (nullable, nonatomic, copy) NSString *cpPassword;
@property (nullable, nonatomic, copy) NSString *airlines;
@property (nullable, nonatomic, copy) NSString *airport;
@property (nullable, nonatomic, copy) NSString *city;
@property (nullable, nonatomic, copy) NSString *airportCountry;
@property (nullable, nonatomic, copy) NSString *airportTimezone;
@property (nullable, nonatomic, copy) NSString *countryCode;
@property (nullable, nonatomic, copy) NSString *currencyName;
@property (nullable, nonatomic, copy) NSString *currencyCode;
@property (nullable, nonatomic, copy) NSString *rosterFiletype;
@property (nullable, nonatomic, copy) NSString *cpAirlineIata;
@property (nullable, nonatomic, copy) NSString *cpRosterTimetype;
@property (nullable, nonatomic, copy) NSString *cpRosterDatetimeFormat;
@property (nullable, nonatomic, copy) NSString *rosterDatetimeFormatJava;
@property (nullable, nonatomic, copy) NSString *landingPageUrl;
@property (nullable, nonatomic, copy) NSString *landingPageId;
@property (nullable, nonatomic, copy) NSString *memoParser;
@property (nullable, nonatomic, copy) NSString *jobPosition;
@property (nullable, nonatomic, copy) NSString *deadline;
@property (nullable, nonatomic, copy) NSString *period;
@property (nullable, nonatomic, copy) NSString *flightStatus;
@property (nullable, nonatomic, copy) NSString *airportCity;
@property (nullable, nonatomic, copy) NSString *cpUrl;
@property (nonatomic) BOOL canAutoLogin;
@property (nonatomic) BOOL canParseRoster;
@property (nonatomic) BOOL canParseMemo;
@property (nonatomic) BOOL importStatus;
@property (nullable, nonatomic, copy) NSString *autoImportStatus;
@property (nullable, nonatomic, retain) NSSet<SCAircraft *> *aircraft;

@end

@interface SCUser (CoreDataGeneratedAccessors)

- (void)addAircraftObject:(SCAircraft *)value;
- (void)removeAircraftObject:(SCAircraft *)value;
- (void)addAircraft:(NSSet<SCAircraft *> *)values;
- (void)removeAircraft:(NSSet<SCAircraft *> *)values;

@end

NS_ASSUME_NONNULL_END
