//
//  UserDetails.h
//  KontractHrPortal
//
//  Created by GMSIndia1 on 1/17/14.
//  Copyright (c) 2014 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDetails : NSObject
@property(readwrite)NSInteger primarykey;
@property(strong,nonatomic)NSString *ssnstring;
@property(strong,nonatomic)NSString *passwordstring;
@property(strong,nonatomic)NSString *suffix;
@property(strong,nonatomic)NSString *lastname;
@property(strong,nonatomic)NSString *firstname;
@property(strong,nonatomic)NSString *homeaddress;
@property(strong,nonatomic)NSString *city;
@property(strong,nonatomic)NSString *state;
@property(strong,nonatomic)NSString *zip;
@property(strong,nonatomic)NSString *country;
@property(strong,nonatomic)NSString *dob;
@property(readwrite)NSInteger gender;
@property(strong,nonatomic)NSString *emailid;
@property(strong,nonatomic)NSString *mobileno;
@property(strong,nonatomic)NSString *homeno;
@property(strong,nonatomic)NSString *emergencycontactname;
@property(strong,nonatomic)NSString *contactno;
@property(strong,nonatomic)NSString *alternateno;
@property(strong,nonatomic)NSString *licenceno;
@property(strong,nonatomic)NSString *stateissuinglicence;
@property(strong,nonatomic)NSString *Nameinlicence;
@property(readwrite)NSInteger educationid;
@property(strong,nonatomic)NSString *educationname;
@property(readwrite)NSInteger yearscompleted;
@property(strong,nonatomic)NSString *institutionname;
@property(strong,nonatomic)NSString *Educationcity;
@property(strong,nonatomic)NSString *educationstate;
@property(readwrite)NSInteger certificateid;
@property(strong,nonatomic)NSString *certificatename;
@property(strong,nonatomic)NSString *certificatedate;
@property(readwrite)NSInteger previousid;
@property(strong,nonatomic)NSString *companyname;
@property(strong,nonatomic)NSString *emplymentdate;
@property(strong,nonatomic)NSString *rateofpay;
@property(strong,nonatomic)NSString *previosposition;
@property(strong,nonatomic)NSString *reasonforleaving;
@property(strong,nonatomic)NSString *medication;
@property(readwrite)NSInteger climbingability;
@property(strong,nonatomic)NSString *filename;
@property(strong,nonatomic)NSString *encodedstring;

@end
