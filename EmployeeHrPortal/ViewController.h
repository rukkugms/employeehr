//
//  ViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/5/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsiteViewController.h"
#import "RegisterViewController.h"
#import "LoginViewController.h"

@interface ViewController : UIViewController
@property(strong,nonatomic)RegisterViewController*registerVCtrl;
@property(strong,nonatomic)LoginViewController*loginVCtrl;
@property (strong, nonatomic) NSString *Availablityresult;

- (IBAction)registerbtn:(id)sender;

- (IBAction)employee:(id)sender;
- (IBAction)Alreadyregistered:(id)sender;


/*iphoneOutlets*/

- (IBAction)registerbtn_iphone:(id)sender;

- (IBAction)Alreadyregisterd_iphone:(id)sender;

- (IBAction)employee_iphone:(id)sender;



@end
