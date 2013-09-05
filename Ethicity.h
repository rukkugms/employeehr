//
//  Ethicity.h
//  EmployeePortal
//
//  Created by GMSIndia 2 on 01/08/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ethicity : NSObject
@property(readwrite)NSInteger isConvicted;
@property(strong,nonatomic)NSString *convictexplanation;
@property(strong,nonatomic)NSString *twiccardno;
@property(readwrite)NSInteger agelimit;
@property(readwrite)NSInteger legalrights;
@property(readwrite)NSInteger WorkOverTime;
@property(readwrite)NSInteger WorkedEarlier;
@property(strong,nonatomic)NSString *WorkedPeriod;
@property(readwrite)NSInteger WorkedOutofTown;
@property(strong,nonatomic)NSString *reffered;
@property(strong,nonatomic)NSString *reffereagency;
@property(readwrite)NSInteger IsProtectedVeteran;
@property(readwrite)NSInteger IsDisable;
@property(readwrite)NSInteger IsVietnamEra;
@property(readwrite)NSInteger IsActiveReservist;
@property(readwrite)NSInteger IsDisbledVeteran;
@property(readwrite)NSInteger IsSeperatedVeteran;



@end
