//
//  SCServerManager.h
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/30/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCServerManager : NSObject

+(SCServerManager *)sharedManager;

- (void) loginUserWithEmail:(NSString*)email
                andPassword:(NSString*)password
                  onSuccess:(void (^)(NSDictionary *responseObject))success
                  onFailure:(void(^)(NSDictionary *errorResponse))failure;

- (void) registerUserWithFirstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                             email:(NSString *)email
                          password:(NSString *)password
               passwordConfimation:(NSString *)passwordConfimation
                             photo:(NSString *)photo
                             agree:(NSString *)agree
                              type:(NSString *)type
                         onSuccess:(void (^)(NSDictionary *responseObject))success
                         onFailure:(void(^)(NSDictionary *errorResponse))failure;

@end
