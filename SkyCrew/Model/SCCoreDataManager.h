//
//  SCCoreDataManager.h
//  SkyCrew
//
//  Created by Yuriy Lubinets on 10/6/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SCCoreDataManager : NSObject

+ (SCCoreDataManager *)sharedManager;

- (void)createUserWithUserInfo:(NSDictionary *)infoDictionary;

@end
