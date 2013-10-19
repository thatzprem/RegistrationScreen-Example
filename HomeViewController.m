//
//  HomeViewController.m
//  TestAPS
//
//  Created by Prem kumar on 20/08/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "HomeViewController.h"
#import "HighlightUITextField.h"

#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]


@interface HomeViewController ()

@property(nonatomic,strong) UIToolbar *toolBar;
@property(nonatomic,strong) UISegmentedControl *segControl;
@end

BOOL isPasscodeMatched = NO;
BOOL isEmailMatched = NO;

@implementation HomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self addToolBar];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    if (textField.tag == 101) {
        [self.confirmEmailTextField becomeFirstResponder];
    }    
    if (textField.tag == 102) {
        [self.passcodeTextField becomeFirstResponder];
    }
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
   
    if (textField.tag == 101 || textField.tag == 102) {
        if (![self validateEmail:textField.text]) {
            
            if (textField.tag == 101) {
                self.emailTextField.text = @"";
            }
            else if (textField.tag == 102)
            {
                self.confirmEmailTextField.text = @"";
            }
            NSLog(@"The email format is invalid.");
        }
    }

    return YES;
}

- (BOOL)validateEmail:(NSString*)emailValue{
    NSString *emailString = emailValue;
    NSString *emailReg = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailReg];
    if ([emailTest evaluateWithObject:emailString] != YES || [emailString isEqualToString:@""]){
        return NO;
    }else{
        return YES;
    }
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    [self resetGlowInAllPasscodeFields];

    if (textField.tag == 100){
        [self.nameTextField glow];
    }
    if (textField.tag == 101) {
        [self.emailTextField glow];
    }
    if (textField.tag == 102) {
        [self.confirmEmailTextField glow];
    }
    if (textField.tag == 200) {
        [self focusToPasscodeTextField:textField.text];
    }
    if (textField.tag == 300) {
        [self focusToReenterPasscodeTextField:textField.text];
    }
    return YES;
}

- (void)focusToPasscodeTextField:(NSString *)text{
    
    if (text.length == 0) {
        [self.firstDigitTextField glow];
    }
    else if (text.length == 1){
        [self.secondDigitTextField glow];
    }
    else if (text.length == 2){
        [self.thirdDigitTextField glow];
    }
    else if (text.length == 3){
        [self.fourthDigitTextField glow];
    }
    if (text.length == 4) {
        [self.fourthDigitTextField glow];
    }
}

- (void)focusToReenterPasscodeTextField:(NSString *)text{
    
    if (text.length == 0) {
        [self.firstReEntryTextField glow];
    }
    else if (text.length == 1){
        [self.secondReEntryTextField glow];
    }
    else if (text.length == 2){
        [self.thirdReEntryTextField glow];
    }
    else if (text.length == 3){
        [self.fourthReEntryTextField glow];
    }
    if (text.length == 4) {
        [self.fourthReEntryTextField glow];
    }
}

- (void)resetGlowInAllPasscodeFields{
    
    if ([self.nameTextField isGlowing]) {
        [self.nameTextField unGlow];
    }
    if ([self.emailTextField isGlowing]) {
        [self.emailTextField unGlow];
    }
    if ([self.confirmEmailTextField isGlowing]) {
        [self.confirmEmailTextField unGlow];
    }
    if ([self.firstDigitTextField isGlowing]) {
        [self.firstDigitTextField unGlow];
    }
    if ([self.secondDigitTextField isGlowing]) {
        [self.secondDigitTextField unGlow];
    }
    if ([self.thirdDigitTextField isGlowing]) {
        [self.thirdDigitTextField unGlow];
    }
    if ([self.fourthDigitTextField isGlowing]) {
        [self.fourthDigitTextField unGlow];
    }
    if ([self.firstReEntryTextField isGlowing]) {
        [self.firstReEntryTextField unGlow];
    }
    if ([self.secondReEntryTextField isGlowing]) {
        [self.secondReEntryTextField unGlow];
    }
    if ([self.thirdReEntryTextField isGlowing]) {
        [self.thirdReEntryTextField unGlow];
    }
    if ([self.fourthReEntryTextField isGlowing]) {
        [self.fourthReEntryTextField unGlow];
    }
    

}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    
    if (textField.tag == 102) {
        if ([self.emailTextField.text isEqualToString:self.confirmEmailTextField.text]) {
            NSLog(@"email matched");
            isEmailMatched = YES;
        }
        else{
            NSLog(@"email mismatch");
            isEmailMatched = NO;
        }
    }
    if (textField.tag == 200) {
        [self.fourthDigitTextField unGlow];
    }
    if (textField.tag == 300) {
        [self.fourthReEntryTextField unGlow];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    textField.inputAccessoryView = self.toolBar;
    [self updateSegmentedViewSelectioForTap:textField];
    if (textField.tag == 201 || textField.tag == 202 || textField.tag == 203 || textField.tag == 204) {
        [self performSelector:@selector(makePasscodeTextFieldFirstResponder) withObject:self afterDelay:0.1];
    }
    if (textField.tag == 301 || textField.tag == 302 || textField.tag == 303 || textField.tag == 304) {
        [self performSelector:@selector(makeReenterPasscodeTextFieldFirstResponder) withObject:self afterDelay:0.1];
    }
}


- (void)makePasscodeTextFieldFirstResponder{
    [self.passcodeTextField becomeFirstResponder];
}
- (void)makeReenterPasscodeTextFieldFirstResponder{
    [self.reEntryPasscodeTextField becomeFirstResponder];
}

-(void)updateCreatePasscodeTextFieldToGlow:(NSString *)string{
    
    
    if (string.length == 0) {
        [self.firstDigitTextField glow];
        [self.secondDigitTextField unGlow];
        [self.thirdDigitTextField unGlow];
        [self.fourthDigitTextField unGlow];
    }
    else if (string.length == 1){
        [self.firstDigitTextField unGlow];
        [self.secondDigitTextField glow];
        [self.thirdDigitTextField unGlow];
        [self.fourthDigitTextField unGlow];
    }
    else if (string.length == 2){
        [self.firstDigitTextField unGlow];
        [self.secondDigitTextField unGlow];
        [self.thirdDigitTextField glow];
        [self.fourthDigitTextField unGlow];
    }
    else if (string.length == 3){
        [self.firstDigitTextField unGlow];
        [self.secondDigitTextField unGlow];
        [self.thirdDigitTextField unGlow];
        [self.fourthDigitTextField glow];
    }
}

-(void)updateReenterPasscodeTextFieldToGlow:(NSString *)string{
    
    if (string.length == 0) {
        [self.firstReEntryTextField glow];
        [self.secondReEntryTextField unGlow];
        [self.thirdReEntryTextField unGlow];
        [self.fourthReEntryTextField unGlow];
    }
    else if (string.length == 1){
        [self.firstReEntryTextField unGlow];
        [self.secondReEntryTextField glow];
        [self.thirdReEntryTextField unGlow];
        [self.fourthReEntryTextField unGlow];
    }
    else if (string.length == 2){
        [self.firstReEntryTextField unGlow];
        [self.secondReEntryTextField unGlow];
        [self.thirdReEntryTextField glow];
        [self.fourthReEntryTextField unGlow];
    }
    else if (string.length == 3){
        [self.firstReEntryTextField unGlow];
        [self.secondReEntryTextField unGlow];
        [self.thirdReEntryTextField unGlow];
        [self.fourthReEntryTextField glow];
    }
}

#pragma mark Toolbar
-(void) addToolBar{
    
    //Create Tool bar
    self.toolBar = [[UIToolbar alloc] init];
    [self.toolBar sizeToFit];
    
    //Create segmented control
    UISegmentedControl* segControl = [[UISegmentedControl alloc] initWithItems:@[@"Previous", @"Next"]];
    [segControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    segControl.momentary = YES;
    [segControl addTarget:self action:@selector(changeRow:) forControlEvents:(UIControlEventValueChanged)];
    [segControl setEnabled:NO forSegmentAtIndex:0];
    [segControl setEnabled:YES forSegmentAtIndex:1];
    UIBarButtonItem *nextButton = [[UIBarButtonItem alloc] initWithCustomView:segControl];
    self.segControl = segControl;
    
    //Flexible space/
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    //Done Button
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]  initWithTitle: @"Done" style:UIBarButtonItemStyleBordered target:self action:@selector(resignAnyFirstResponderInScreen)];
    
    NSArray *itemsArray = @[nextButton,flexItem,doneButton];
    [self.toolBar setItems:itemsArray];
    
}

-(void)updateSegmentedViewSelectioForTap:(id)sender{
    
    UITextField *tappedTextView = (UITextField *)sender;
    if (tappedTextView.tag == 100) {
        [self.segControl setEnabled:YES forSegmentAtIndex:1];
        [self.segControl setEnabled:NO forSegmentAtIndex:0];
    }
    else if (tappedTextView.tag == 301 ||tappedTextView.tag == 302 ||tappedTextView.tag == 303 || tappedTextView.tag == 304 || tappedTextView.tag == 300){
        [self.segControl setEnabled:NO forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
    }
    else{
        [self.segControl setEnabled:YES forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
    }
}
- (void)changeRow:(id)sender {
    int idx = [sender selectedSegmentIndex];
    if (idx == 1) {
        [self gotoNextResponder:sender];
    }
    else {
        [sender setEnabled:NO forSegmentAtIndex:0];
        [sender setEnabled:YES forSegmentAtIndex:1];
        [self gotoPreviousResponder:sender];
    }
}

#pragma mark Next & Previous responder
- (void)gotoNextResponder:(id)sender{
    
    if ([self.nameTextField isFirstResponder]) {
        [self.segControl setEnabled:YES forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
        [self.emailTextField becomeFirstResponder];
    }
    else if ([self.emailTextField isFirstResponder]){
        [self.segControl setEnabled:YES forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
        [self.confirmEmailTextField becomeFirstResponder];
    }
    else if ([self.confirmEmailTextField isFirstResponder]){
        [self.segControl setEnabled:YES forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
        
        if (self.passcodeTextField.text.length == 4){
            if (self.reEntryPasscodeTextField.text.length == 4) {
                [self.view endEditing:YES];
            }
            else{
                [self.reEntryPasscodeTextField becomeFirstResponder];
            }
        }
        else{
            [self.passcodeTextField becomeFirstResponder];
        }
    }
    else if ([self.passcodeTextField isFirstResponder]){
        [self.segControl setEnabled:NO forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
        
        if (self.reEntryPasscodeTextField.text.length == 4) {
            [self.view endEditing:YES];
        }
        else{
            [self.reEntryPasscodeTextField becomeFirstResponder];
        }
    }
    else if ([self.reEntryPasscodeTextField isFirstResponder]){
        [self.segControl setEnabled:NO forSegmentAtIndex:1];
        [self.segControl setEnabled:YES forSegmentAtIndex:0];
        [self.reEntryPasscodeTextField resignFirstResponder];
    }
}

- (void)gotoPreviousResponder:(id)sender{
    
    if ([self.emailTextField isFirstResponder]) {
        [sender setEnabled:YES forSegmentAtIndex:1];
        [sender setEnabled:NO forSegmentAtIndex:0];
        [self.nameTextField becomeFirstResponder];
    }
    else if ([self.confirmEmailTextField isFirstResponder]){
        [sender setEnabled:YES forSegmentAtIndex:1];
        [sender setEnabled:YES forSegmentAtIndex:0];
        [self.emailTextField becomeFirstResponder];
    }
    else if ([self.passcodeTextField isFirstResponder]){
        [sender setEnabled:YES forSegmentAtIndex:1];
        [sender setEnabled:YES forSegmentAtIndex:0];
        [self.confirmEmailTextField becomeFirstResponder];
    }
    else if ([self.reEntryPasscodeTextField isFirstResponder]){
        [sender setEnabled:YES forSegmentAtIndex:1];
        [sender setEnabled:YES forSegmentAtIndex:0];
        [self.passcodeTextField becomeFirstResponder];
    }
    else if ([self.nameTextField isFirstResponder]){
        [sender setEnabled:YES forSegmentAtIndex:1];
        [sender setEnabled:NO forSegmentAtIndex:0];
        [self.nameTextField resignFirstResponder];
    }
}

-(void)resignAnyFirstResponderInScreen{
    
    if ([self.nameTextField isFirstResponder]) {
        [self.nameTextField resignFirstResponder];
    }
    else if ([self.emailTextField isFirstResponder]){
        [self.emailTextField resignFirstResponder];
    }
    else if ([self.confirmEmailTextField isFirstResponder]){
        [self.confirmEmailTextField resignFirstResponder];
    }
    else if ([self.passcodeTextField isFirstResponder]){
        [self.passcodeTextField resignFirstResponder];
    }
    else if ([self.reEntryPasscodeTextField isFirstResponder]){
        [self.reEntryPasscodeTextField resignFirstResponder];
    }
}


-(void) updatePasscode:(NSString*) typedString tagStart:(int) start {
    for(int t=0;t<4;++t) {
        UITextField* tf = (UITextField*)[self.view viewWithTag:start+t];
        tf.text = (typedString.length > t) ? @" " : @"";
        tf.secureTextEntry = YES;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    
    if (textField.tag == 200) {
        NSString *typedString = [textField.text stringByReplacingCharactersInRange: range
                                                                        withString: string];
        [self updateCreatePasscodeTextFieldToGlow:typedString];
        [self updatePasscode:typedString tagStart:201];
        
        if(string.length == 0 && range.length== 1 && range.location > 0) {
            textField.text = typedString;
            return NO;
        }
        
        if (typedString.length == 4)
        {
            [self performSelector:@selector(resignFirstResponderTextView) withObject:self afterDelay:0.0];
        }
        if (typedString.length > 4) {
            [self.passcodeTextField resignFirstResponder];
            return NO;
        }
        
    } else if (textField.tag == 300){
        
        NSString *typedString = [textField.text stringByReplacingCharactersInRange: range
                                                                        withString: string];
        [self updateReenterPasscodeTextFieldToGlow:typedString];
        [self updatePasscode:typedString tagStart:301];
        
        if(string.length == 0 && range.length== 1 && range.location > 0) {
            textField.text = typedString;
            return NO;
        }
        if (typedString.length == 4) {
            
            [self performSelector:@selector(resignFirstResponderTextView) withObject:self afterDelay:0.1];
        }
        if (typedString.length > 4) {
            
            [self.reEntryPasscodeTextField resignFirstResponder];
            return NO;
        }
    }
    
    else if(textField == self.emailTextField || self.confirmEmailTextField == textField) {
        
        NSString *typedString = [textField.text stringByReplacingCharactersInRange: range
                                                                        withString: string];
        NSRange upperCaseRange = [typedString rangeOfCharacterFromSet:[NSCharacterSet uppercaseLetterCharacterSet]];
        if (upperCaseRange.location != NSNotFound) {
            textField.text = [textField.text stringByReplacingCharactersInRange:range withString:[string lowercaseString]];
            return NO;
        }
    }

    
    return YES;
}

- (void)resignFirstResponderTextView{
    
    if ([self.passcodeTextField isFirstResponder]) {
        [self.reEntryPasscodeTextField becomeFirstResponder];
    }
    else if ([self.reEntryPasscodeTextField isFirstResponder]){
        [self.reEntryPasscodeTextField resignFirstResponder];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submitButtonPressed:(id)sender {
    
    if ((self.nameTextField != nil) && (isEmailMatched) && (isPasscodeMatched)) {
        NSLog(@"Can procced with getstarted button pressed.");
    }
    else{
        if (self.nameTextField != nil)
        {
            NSLog(@"Name field is empty");
        }
        else if (!isPasscodeMatched)
        {
            NSLog(@"Passcode mismatch");
        }
        else if (!isEmailMatched){
            NSLog(@"email mismatch");
        }
    }
}
@end
