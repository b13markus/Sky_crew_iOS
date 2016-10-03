//
//  SCLoginVC.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/30/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCLoginVC.h"
#import "SCRegistrationFormVC.h"
#import "SCServerManager.h"

@interface SCLoginVC ()

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UITextField *loginTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttonOutlets;
@property (assign, nonatomic) BOOL keyboardIsVisible;

@end

@implementation SCLoginVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.backgroundImageView setImage:[UIImage imageNamed:@"background2"]];
    [self makeCornerRoundingForElement:self.loginTextField];
    [self makeCornerRoundingForElement:self.passwordTextField];
    
    for (UIButton* button in self.buttonOutlets) {
        [self makeCornerRoundingForElement:button];
    }
    [self setGestureRecognizer];
    self.keyboardIsVisible = NO;
    
    // Listen for keyboard appearances and disappearances
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];

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
        
    }
}

#pragma mark - NSNotifications

- (void)keyboardDidShow: (NSNotification *) notif {
    self.keyboardIsVisible = YES;
}

- (void)keyboardDidHide: (NSNotification *) notif {
    self.keyboardIsVisible = NO;
}

#pragma mark - Hide Keyboard

- (void) setGestureRecognizer {
    
    UIGestureRecognizer *tapper;
    
    tapper = [[UITapGestureRecognizer alloc]
              initWithTarget:self action:@selector(handleSingleTap:)];
    tapper.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapper];
    
}

- (void) handleSingleTap:(UITapGestureRecognizer *) sender {
    
    [self.view endEditing:YES];
}


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"segueToRegisterView"]) {

        SCRegistrationFormVC *vc = [segue destinationViewController];

        [vc setRegistrationType:(SCRegistrationFormVCType)[sender integerValue]];
    }
}


#pragma  mark - Actions

- (IBAction)loginAction:(UIButton *)sender {
    
    [[SCServerManager sharedManager]loginUserWithEmail:self.loginTextField.text
                                           andPassword:self.passwordTextField.text onSuccess:^{
    
    
                                           } onFailure:^{
    
    
                                           }];
}
- (IBAction)forgotPasswordAction:(UIButton *)sender {
}

- (IBAction)registerAsCrewAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"segueToRegisterView" sender:[NSNumber numberWithInteger:SCRegistrationFormVCTypeCrew]];
}
- (IBAction)registerAsFamilyAction:(UIButton *)sender {
    [self performSegueWithIdentifier:@"segueToRegisterView" sender:[NSNumber numberWithInteger:SCRegistrationFormVCTypeFamily]];
}


@end
