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
                  onSuccess:(void (^)())success
                  onFailure:(void(^)(NSString* errorResponse))failure;

- (void) registerUserWithFirstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                             email:(NSString *)email
                          password:(NSString *)password
               passwordConfimation:(NSString *)passwordConfimation
                             photo:(NSData *)photo
                             agree:(NSString *)agree
                              type:(NSString *)type
                         onSuccess:(void (^)())success
                         onFailure:(void(^)())failure;

@end
