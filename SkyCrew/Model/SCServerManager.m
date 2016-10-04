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
                onFailure:(void(^)(NSString* errorResponse))failure {
    
    NSDictionary* params = @{
       @"email": email,
       @"password": password
    };

    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.sessionManager POST:@"login"
                   parameters:params
                     progress:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
                          NSLog(@"%@", responseObject);
        
                    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
                        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                        NSLog(@"%@",errResponse);
                        NSLog(@"eror - %@", error);
                    }];
}

- (void) registerUserWithFirstName:(NSString *)firstName
                          lastName:(NSString *)lastName
                             email:(NSString *)email
                          password:(NSString *)password
               passwordConfimation:(NSString *)passwordConfimation
                             photo:(NSData *)photo
                             agree:(NSString *)agree
                              type:(NSString *)type
                         onSuccess:(void (^)())success
                         onFailure:(void(^)())failure {

    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys:
                            
                            firstName, @"firstName",
                            lastName, @"lastName",
                            email, @"email",
                            password, @"password",
                            passwordConfimation, @"passwordConfirmation",
                            @"", @"photo",
                            agree, @"iAgree",
                            type, @"type", nil];
//    {
//        "firstName": "nafrefme",
//        "lastName": "reffer",
//        "email": "someMail@gmail.com",
//        "password": "1111",
//        "passwordConfirmation": "1111",
//        "photo": "",
//        "iAgree": true,
//        "type": "crewMember"
//    }
    
    NSLog(@"params - %@", params);
    
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
    [self.sessionManager POST:@"registration"
                   parameters:params
                     progress:nil
                      success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                          
                          NSLog(@"%@", responseObject);
                          
                      } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                          
                          NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
                          NSLog(@"%@",errResponse);
                          NSLog(@"eror - %@", error);
                      }];

    
}


@end
