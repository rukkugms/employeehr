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

@end
