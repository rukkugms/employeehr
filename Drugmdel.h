//
//  Drugmdel.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 8/5/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Drugmdel : NSObject
@property(readwrite)NSInteger drugid;
@property(strong,nonatomic)NSString*requiremntname;
@property(strong,nonatomic)NSString*drugdate;
@property(strong,nonatomic)NSString*type;


@end
