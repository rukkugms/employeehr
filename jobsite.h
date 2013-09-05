//
//  jobsite.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/24/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface jobsite : NSObject
@property(strong,nonatomic)NSString*jobsiteid;
@property(strong,nonatomic)NSString*safetycouncilstatus;
@property(strong,nonatomic)NSString*safetycouncilexpiry;
@property(strong,nonatomic)NSString*nccertstatus;
@property(strong,nonatomic)NSString*NCCERTDescription;
@property(strong,nonatomic)NSString*ApplicantSkill;
@property(strong,nonatomic)NSString*ApplicantCraft;
@end
