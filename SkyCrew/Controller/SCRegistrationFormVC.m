//
//  SCRegistrationFormVC.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 9/29/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCRegistrationFormVC.h"
#import "SCServerManager.h"

@interface SCRegistrationFormVC () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

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
@property (assign, nonatomic) BOOL keyboardIsVisible;

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
        
    } else if ([element isKindOfClass:[UIImageView class]]) {
        
        UIImageView* imageViewElement = element;

        [imageViewElement.layer setCornerRadius:5.0];
        [imageViewElement.layer setMasksToBounds:YES];
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


#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.userPhotoImageView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Alert

- (void)showAlertWithMessage:(NSString *)message {
    
    UIAlertController * alert=   [UIAlertController
                                  alertControllerWithTitle:@""
                                  message:message
                                  preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {
                               }];
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Privat Methods

- (BOOL) checkIfAllFealdsAreFilled {
    
    if (self.firstNameTextField.text.length == 0) {
        return NO;
    }
    if (self.lastNameTextField.text.length == 0) {
        return NO;
    }
    if (self.emailAdressTextField.text.length == 0) {
        return NO;
    }
    if (self.passwordTextField.text.length == 0) {
        return NO;
    }
    if (self.confirmPasswordTextField.text.length == 0) {
        return NO;
    }
    if (self.checkBoxButton.selected == NO) {
        return NO;

    }
    
    return YES;
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
    
    [self performSegueWithIdentifier:@"unwindFromLoginView" sender:nil];
}
- (IBAction)submitAction:(UIButton *)sender {
    
    if ([self checkIfAllFealdsAreFilled]) {
        
//        NSData *userPhoto = [[NSData alloc]init];
        NSString *userPhoto = [UIImagePNGRepresentation(self.userPhotoImageView.image) base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
        NSString *agree = @"true";
        NSString *type;
        
        if (self.registrationType == SCRegistrationFormVCTypeCrew) {
           
            type = @"crewMember";
        } else {
            
            type = @"familyMember";
        }
       
        
        [[SCServerManager sharedManager] registerUserWithFirstName:self.firstNameTextField.text
                                                          lastName:self.lastNameTextField.text
                                                             email:self.emailAdressTextField.text
                                                          password:self.passwordTextField.text
                                               passwordConfimation:self.confirmPasswordTextField.text
                                                             photo:userPhoto
                                                             agree:agree
                                                              type:type
                                                         onSuccess:^{
                                                             
                                                             
                                                         } onFailure:^(NSDictionary* errorResponse){
                                                             
                                                             NSString *errorMessage = [errorResponse objectForKey:@"message"];
                                                             [self showAlertWithMessage:errorMessage];
                                                         }];
    }
}
- (IBAction)changeUserPhotoAction:(UIButton *)sender {
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    picker.allowsEditing = YES;
    picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    [self presentViewController:picker animated:YES completion:nil];
}


@end
