//
//  HighlightUITextField.m
//  TestAPS
//
//  Created by Prem kumar on 16/10/13.
//  Copyright (c) 2013 freakApps. All rights reserved.
//

#import "HighlightUITextField.h"
#import <QuartzCore/QuartzCore.h>


#define RGB(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define frameValue CGRectMake(30, 100, 260, 38)
#define cRatio 1
#define bColor RGB(166, 166, 166)
#define bWidth 2
#define lColor RGB(195, 33, 72)
#define lSize 8
#define lbColor RGB(235, 235, 235)


@implementation HighlightUITextField

-(void)awakeFromNib{
    
    _borderColor = bColor;
    _cornerRadio = cRatio;
    _borderWidth = bWidth;
    _lightColor = lColor;
    _lightSize = lSize;
    _lightBorderColor = lbColor;
    
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(beginEditing:) name:UITextFieldTextDidBeginEditingNotification object:self];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(endEditing:) name:UITextFieldTextDidEndEditingNotification object:self];
    [self.layer setCornerRadius:_cornerRadio];
    [self.layer setBorderColor:_borderColor.CGColor];
    [self.layer setBorderWidth:_borderWidth];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self setBackgroundColor:[UIColor whiteColor]];
    [self.layer setMasksToBounds:NO];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)beginEditing:(NSNotification*) notification
{
    self.isGlowing = YES;
    
	[[self layer] setShadowOffset:CGSizeMake(0, 0)];
    [[self layer] setShadowRadius:_lightSize];
    [[self layer] setShadowOpacity:1];
    [[self layer] setShadowColor:_lightColor.CGColor];
	[self.layer setBorderColor:_lightBorderColor.CGColor];
}

- (BOOL)endEditing:(BOOL)boolValue
{
    self.isGlowing = NO;
    
	[[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowRadius:0];
    [[self layer] setShadowOpacity:0];
    [[self layer] setShadowColor:nil];
	[self.layer setBorderColor:_borderColor.CGColor];
    return YES;
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGRect)textRectForBounds:(CGRect)bounds
{
	CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio*2,
							  bounds.origin.y,
							  bounds.size.width - _cornerRadio*2,
							  bounds.size.height);
    return inset;
}

- (CGRect)editingRectForBounds:(CGRect)bounds
{
	CGRect inset = CGRectMake(bounds.origin.x + _cornerRadio*2,
							  bounds.origin.y,
							  bounds.size.width - _cornerRadio*2,
							  bounds.size.height);
    return inset;
}

- (void)glow{
    
    self.isGlowing = YES;
    
    [[self layer] setShadowOffset:CGSizeMake(0, 0)];
    [[self layer] setShadowRadius:_lightSize];
    [[self layer] setShadowOpacity:1];
    [[self layer] setShadowColor:_lightColor.CGColor];
	[self.layer setBorderColor:_lightBorderColor.CGColor];
}
- (void)unGlow{
    
    self.isGlowing = NO;
    
    [[self layer] setShadowOffset:CGSizeZero];
    [[self layer] setShadowRadius:0];
    [[self layer] setShadowOpacity:0];
    [[self layer] setShadowColor:nil];
	[self.layer setBorderColor:_borderColor.CGColor];
}

@end
