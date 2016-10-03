//
//  SCServerManager.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/30/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCServerManager.h"
#import "AFNetworking.h"
#import "AFNetworkActivityLogger.h"

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



- (void) loginUserWithEmail:(NSString*)email
              andPassword:(NSString*)password
                onSuccess:(void (^)())success
                onFailure:(void(^)())failure {
    
    self.sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
//    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
 
    NSDictionary* body = @{
       @"email": email,
       @"password": password
    };

    [self.sessionManager POST:@"login" parameters:body progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSString *strData = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];

        NSLog(@"%@", responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        NSString* errResponse = [[NSString alloc] initWithData:(NSData *)error.userInfo[AFNetworkingOperationFailingURLResponseDataErrorKey] encoding:NSUTF8StringEncoding];
        NSLog(@"%@",errResponse);
        NSLog(@"eror - %@", error);

        
    }];
}



//- (void)getIngridientsForId:(NSString*)recipeId onSuccess:(void (^)(NSArray *ingredientsArray))success
//                    onfailure:(void (^)(void))failure {
//    
//    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
//    sessionManager.requestSerializer = [AFJSONRequestSerializer serializer];
//    sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    
//    NSDictionary* params =
//    [NSDictionary dictionaryWithObjectsAndKeys:
//     kAPIKey,  @"key",
//     recipeId, @"rId", nil];
//    
//    [sessionManager GET:kRecipesUrlString
//             parameters:params
//               progress:nil
//                success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                    
//                    NSDictionary *dataDictionary = [[NSDictionary alloc]init];
//                    NSArray *ingridientsArray = [[NSArray alloc]init];
//                    
//                    NSError *error = nil;
//                    id object = [NSJSONSerialization
//                                 JSONObjectWithData:responseObject
//                                 options:0
//                                 error:&error];
//                    
//                    if(!error) {
//                        
//                        if ([object isKindOfClass:[NSDictionary class]]) {
//                            dataDictionary = [object objectForKey:@"recipe"];
//                            ingridientsArray = [dataDictionary objectForKey:@"ingredients"];
//                        }
//                        
//                        if (success) {
//                            success(ingridientsArray);
//                        }
//                    } else {
//                        
//                        if (failure) {
//                            
//                            failure();
//                        }
//                    }
//                    
//                } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                    
//                    if (failure) {
//                        failure();
//                    }
//                }];
//}
@end
