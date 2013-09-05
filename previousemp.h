//
//  previousemp.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/30/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface previousemp : NSObject
@property(strong,nonatomic)NSString *applicantid;
@property(readwrite)NSInteger previousid;
@property(strong,nonatomic)NSString *previouscompany;
@property(strong,nonatomic)NSString *dateofemployee;
@property(strong,nonatomic)NSString *previousrateofpay;
@property(strong,nonatomic)NSString *previousposition;
@property(strong,nonatomic)NSString *reasonforleaving;

@end
