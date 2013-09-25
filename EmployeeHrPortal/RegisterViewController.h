//
//  RegisterViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/16/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsiteViewController.h"
#import "Validation.h"
@interface RegisterViewController : UIViewController<UITextFieldDelegate>
{
        BOOL recordResults;
    NSInteger Applicantid;
    NSInteger webtype;
    NSString *ssnstring;
}
@property(strong,nonatomic)JobsiteViewController*firstVCtrl;
@property (strong, nonatomic) NSString *connectstring;
@property (strong, nonatomic) IBOutlet UITextField *Ssntxtfld;
@property (strong, nonatomic) IBOutlet UITextField *passwdtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *confirmpasswrd;
@property(strong,nonatomic)Validation *val;

/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


- (IBAction)continuebtn:(id)sender;

//iphone
@property (strong, nonatomic) IBOutlet UITextField *Ssntxtfld_iphone;
@property (strong, nonatomic) IBOutlet UITextField *passwdtxtfld_iphone;
@property (strong, nonatomic) IBOutlet UITextField *confirmpasswrd_iphone;
-(IBAction)continue_iphone:(id)sender;
-(IBAction)textfldshouldreturn:(id)sender;

@end
