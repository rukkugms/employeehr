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


@end
