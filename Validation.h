//
//  Validation.h
//  Expensetrack
//
//  Created by GMSIndia1 on 4/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validation : NSObject
-(BOOL)isBlank:(NSString *)string;
-(BOOL)isNumeric:(NSString *)input;
-(BOOL) validEmailAddress:(NSString*) emailStr;
-(BOOL)isdataformat:(NSString *)input;
-(BOOL)isssnformat:(NSString *)input;
@end
