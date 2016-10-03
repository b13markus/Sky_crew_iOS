//
//  SCRegistrationFormVC.h
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/29/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    
    SCRegistrationFormVCTypeCrew,
    SCRegistrationFormVCTypeFamily,
    
} SCRegistrationFormVCType;

@interface SCRegistrationFormVC : UIViewController

@property (assign, nonatomic) SCRegistrationFormVCType registrationType;

@end
