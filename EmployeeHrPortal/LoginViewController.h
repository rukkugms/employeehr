//
//  LoginViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/16/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsiteViewController.h"
@interface LoginViewController : UIViewController{
    BOOL recordResults;
 NSInteger Applicantid;
}
/*Outlets */
@property (strong, nonatomic) IBOutlet UITextField *ssntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *passwordtxtfld;

@property(strong,nonatomic)JobsiteViewController*firstVCtrl;
/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

- (IBAction)loginbtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

@end
