//
//  SCRosterVC.m
//  SkyCrew
//
//  Created by Yuriy Lubinets on 10/5/16.
//  Copyright © 2016 StarApps. All rights reserved.
//

#import "SCRosterVC.h"

@interface SCRosterVC ()

@end

@implementation SCRosterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self showAlertWithMessage:@"Fill in your profile to continue"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Alert

- (void)showAlertWithMessage:(NSString *)message {
    
    UIAlertController *alert = [UIAlertController
                                alertControllerWithTitle:@""
                                message:message
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okButton = [UIAlertAction
                               actionWithTitle:@"OK"
                               style:UIAlertActionStyleCancel
                               handler:^(UIAlertAction * action) {
                                   [self performSegueWithIdentifier:@"segueFromRosterToProfile" sender:nil];
                               }];
    [alert addAction:okButton];
    
    [self presentViewController:alert animated:YES completion:nil];
}


@end
