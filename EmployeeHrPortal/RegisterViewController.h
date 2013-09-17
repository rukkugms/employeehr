//
//  RegisterViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/16/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsiteViewController.h"
@interface RegisterViewController : UIViewController{
        BOOL recordResults;
    NSInteger Applicantid;
    NSInteger webtype;
    NSString *ssnstring;
}
@property(strong,nonatomic)JobsiteViewController*firstVCtrl;

@property (strong, nonatomic) IBOutlet UITextField *Ssntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *passwdtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *confirmpasswrd;


/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


- (IBAction)continuebtn:(id)sender;


@end
