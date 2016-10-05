//
//  SCServerManager.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/30/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCServerManager.h"
#import "AFNetworking.h"

@interface SCServerManager ()

@property (strong, nonatomic) AFHTTPSessionManager* sessionManager;
@end

@implementation SCServerManager


+(SCServerManager *)sharedManager {
    static SCServerManager* manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[SCServerManager alloc]init];
    });
    
    return manager;
}

- (id)init
{
    self = [super init];
    if (self) {
        
        NSURL* url = [NSURL URLWithString:@"http://dev.skycrewapp.com/api/v2/"];
        
        self.sessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:url];
    }
    return self;
}



- (void) loginUserWithEmail:(NSString *)email
              andPassword:(NSString *)password
                onSuccess:(void (^)())success
                onFailure:(void(^)(NSDictionary* errorResponse))failure {
    
    NSDictionary* params = @{
       @"email": email,
       @"password": password
    };

    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [self.sessionManager POST:@"login"
                   parameters:params
                     progress:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
                          NSLog(@"%@", responseObject);
                          
        
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
                        NSError* parseError;
                        NSData *responseData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
                        NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData
                                                                                     options:kNilOptions
                                                                                       error:&parseError];

                        if (failure) {
        
                            failure(responseDict);
                        }
                    }];
}

- (void) registerUserWithFirstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                             email:(NSString *)email
                          password:(NSString *)password
               passwordConfimation:(NSString *)passwordConfimation
                             photo:(NSString *)photo
                             agree:(NSString *)agree
                              type:(NSString *)type
                         onSuccess:(void (^)())success
                         onFailure:(void(^)(NSDictionary *errorResponse))failure {

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                            
                            firstName, @"firstName",
                            lastName, @"lastName",
                            email, @"email",
                            password, @"password",
                            passwordConfimation, @"passwordConfirmation",
                            @"", @"photo",
                            agree, @"iAgree",
                            type, @"type", nil];

    
    NSLog(@"params - %@", params);
    
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.sessionManager POST:@"registration"
                   parameters:params
                     progress:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          
                          NSLog(@"%@", responseObject);
                          NSLog(@"%@", task.response.debugDescription);

                          
                          
                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          
                          NSError* parseError;
                          NSData *responseData = error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey];
                          NSDictionary *responseDict = [NSJSONSerialization JSONObjectWithData:responseData
                                                                                       options:kNilOptions
                                                                                         error:&parseError];
                          NSLog(@"erf - %@", responseDict);
                          
                          if (failure) {
                              
                              failure(responseDict);
                          }
                      }];

    
}


@end
