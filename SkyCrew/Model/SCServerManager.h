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
                  onFailure:(void(^)())failure;
@end
