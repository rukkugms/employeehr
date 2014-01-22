//
//  certificateModel.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/29/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface certificateModel : NSObject
@property(readwrite)NSInteger certificateid;
@property(strong,nonatomic)NSString*certificatename;
@property(strong,nonatomic)NSString*date;
@property(readwrite)NSInteger primarykey;


@end
