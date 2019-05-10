//
//  WBRStepper.h
//  Walmart
//
//  Created by Cassio Sousa on 29/10/17.
//  Copyright (c) 2014 Marcelo Santos. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WBRStepper : UIControl

@property (nonatomic, assign) NSInteger stepValue;

//*****
// Initalizes the control with default size and with min and max values provided
//*****
- (id)initWithMaximumValue:(NSInteger)max minimumValue:(NSInteger)min;

//*****
// Initalizes the control with provided frame and with min and max values provided
//*****
- (id)initWithFrame:(CGRect)frame maximumValue:(NSInteger)max minimumValue:(NSInteger)min;

//*****
// When you call showLoading it will disable all buttons and shows the spinner
// When you call stopLoading you should provide the new values (step value, max and minimum)
//*****
- (void)showLoading;
- (void)stopLoadingAndUpdateCurrentValue:(NSInteger)value maximumValue:(NSInteger)max minimumValue:(NSInteger)min;
- (void)setCurrentValue:(NSInteger)value;
- (void)setCurrentValue:(NSInteger)value maximumValue:(NSInteger)max minimumValue:(NSInteger)min;
- (void) setDisableWarranty;

@end
