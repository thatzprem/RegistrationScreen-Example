//
//  HomeViewController.h
//  TestAPS
//
//  Created by Prem kumar on 20/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HighlightUITextField.h"

@interface HomeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *passcodeTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *fourthDigitTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *thirdDigitTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *secondDigitTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *firstDigitTextField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet HighlightUITextField *firstReEntryTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *secondReEntryTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *thirdReEntryTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *fourthReEntryTextField;
@property (weak, nonatomic) IBOutlet UITextField *reEntryPasscodeTextField;
@property (strong, nonatomic) IBOutlet HighlightUITextField *nameTextField;
@property (strong, nonatomic) IBOutlet HighlightUITextField *emailTextField;
@property (weak, nonatomic) IBOutlet HighlightUITextField *confirmEmailTextField;
- (IBAction)submitButtonPressed:(id)sender;
@end
