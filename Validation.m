//
//  Validation.m
//  Expensetrack
//
//  Created by GMSIndia1 on 4/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "Validation.h"

@implementation Validation
-(BOOL)isBlank:(NSString *)string{
    
    if(string.length==0){
        return NO;
    }
    else{
        return YES;
    }
}
-(BOOL)isNumeric:(NSString *)input{
    for(int i=0;i<[input length];i++){
        char c=[input characterAtIndex:i];
        if((c=='-' && c=='0')||((!(c>='0' && c<='9')) && (!(c=='.')))){
            
            return NO;
        }
        
    }
    return YES;
    
}
-(BOOL)isdataformat:(NSString *)input{
    
    for(int i=0;i<[input length];i++){
        char c=[input characterAtIndex:i];
        if (!(c>='0' && c<='9')&& (!(c=='-'))){
            return NO;
            
        }
        
    }
    return YES;
}

-(BOOL) validEmailAddress:(NSString*) emailStr {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailValidation = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if (![emailValidation evaluateWithObject:emailStr]) {
        return FALSE;
    }
    return TRUE;
}

-(BOOL)isssnformat:(NSString *)input{
    
    for(int i=0;i<[input length];i++){
        char c=[input characterAtIndex:i];
        if((c=='.' && c=='0')||((!(c>='0' && c<='9')) && (!(c=='-')))){
            
            return NO;
        }

        
    }
    return YES;
}


@end
