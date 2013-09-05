//
//  Detailcourse.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 8/6/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Detailcourse : NSObject
@property(readwrite)NSInteger CourseId;
@property(strong,nonatomic) NSString* coursedate;
@property(strong,nonatomic)NSString*type;
@property(strong,nonatomic)NSString*coursename;


@end
