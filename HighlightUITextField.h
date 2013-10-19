//
//  HighlightUITextField.h
//  TestAPS
//
//  Created by Prem kumar on 16/10/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HighlightUITextField : UITextField
{
	CGFloat _cornerRadio;
	UIColor *_borderColor;
	CGFloat _borderWidth;
	UIColor *_lightColor;
	CGFloat _lightSize;
	UIColor *_lightBorderColor;
}

@property(nonatomic,assign)BOOL isGlowing;

- (void)glow;

- (void)unGlow;


@end
