//
//  Educationdetails.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/29/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Educationdetails : NSObject
@property(strong,nonatomic)NSString*educationname;
@property(readwrite)NSInteger yearscompleted;
@property(readwrite)NSInteger eduid;

@property(strong,nonatomic)NSString*InstituteName;
@property(strong,nonatomic)NSString*city;
@property(strong,nonatomic)NSString*state;

@end
