//
//  Coursemdl.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 8/29/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Coursemdl : NSObject
@property(readwrite)NSInteger reqid;
@property(strong,nonatomic)NSString*itemname;
@property(strong,nonatomic)NSString*Code;
@property(strong,nonatomic)NSString*Type;
@property(strong,nonatomic)NSString*ApplyToAllCraft;
@property(strong,nonatomic)NSString*HaveExpiryDate;

@property(strong,nonatomic)NSString*expdate;
@property(strong,nonatomic)NSString*month;
@property(strong,nonatomic)NSString*year;
@property(readwrite)NSInteger craft;


@property(readwrite)NSInteger course_status;

@end
