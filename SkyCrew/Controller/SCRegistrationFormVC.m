//
//  SCRegistrationFormVC.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/29/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCRegistrationFormVC.h"

@interface SCRegistrationFormVC ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIImageView *userPhotoImageView;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailAdressTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *checkBoxButton;
@property (weak, nonatomic) IBOutlet UIButton *cancelButton;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation SCRegistrationFormVC

#pragma mark - View LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self makeCornerRoundingForElement:self.userPhotoImageView];
    [self makeCornerRoundingForElement:self.firstNameTextField];
    [self makeCornerRoundingForElement:self.lastNameTextField];
    [self makeCornerRoundingForElement:self.emailAdressTextField];
    [self makeCornerRoundingForElement:self.passwordTextField];
    [self makeCornerRoundingForElement:self.confirmPasswordTextField];
    [self makeCornerRoundingForElement:self.cancelButton];
    [self makeCornerRoundingForElement:self.submitButton];


    [self.backgroundImageView setImage:[UIImage imageNamed:@"background2"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) makeCornerRoundingForElement:(id)element {
    
    if ([element isKindOfClass:[UITextField class]]) {
        
        UITextField* textFieldElement = element;
        
        [textFieldElement.layer setCornerRadius:5.0];
        [textFieldElement.layer setMasksToBounds:YES];
        [textFieldElement.layer setBorderColor:[UIColor whiteColor].CGColor];
        [textFieldElement.layer setBorderWidth:1.0];
        
    } else if ([element isKindOfClass:[UIButton class]]) {
        
        UIButton* buttonElement = element;

        [buttonElement.layer setCornerRadius:5.0];
        [buttonElement.layer setMasksToBounds:YES];
        
    } else if ([element isKindOfClass:[UIImageView class]]) {
        
        UIImageView* imageViewElement = element;

        [imageViewElement.layer setCornerRadius:5.0];
        [imageViewElement.layer setMasksToBounds:YES];
    }
}

#pragma mark - Actions

- (IBAction)checkBoxAction:(UIButton *)sender {
    
    if (sender.selected) {
        
        sender.selected = NO;
        
    } else {
        
        sender.selected = YES;
    }
}
- (IBAction)cancelAction:(UIButton *)sender {
}
- (IBAction)submitAction:(UIButton *)sender {
}
- (IBAction)changeUserPhotoAction:(UIButton *)sender {
}


@end
