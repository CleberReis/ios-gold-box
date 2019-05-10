//
//  WBRContactRequestExchangeTypeModel.m
//  Walmart
//
//  Created by Guilherme Nunes Ferreira on 3/19/18.
//  Copyright © 2018 WMB Comercio Eletronico Ltda. All rights reserved.
//

#import "WBRContactRequestExchangeTypeModel.h"

@implementation WBRContactRequestExchangeTypeModel

+ (JSONKeyMapper*)keyMapper
{
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{@"exchangeLabel" : @"label",
                                                                  @"exchangeType"  : @"type"}];
}

@end
