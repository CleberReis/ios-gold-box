//
//  CardCreditCard.h
//  Walmart
//
//  Created by Marcelo Santos on 3/13/15.
//  Copyright (c) 2015 Marcelo Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WMBaseViewController.h"

@interface CardCreditCard : WMBaseViewController

- (void) fillContentWithDictionary:(NSDictionary *) dictContent andCard:(int) cardNb;

@end