//
//  RegisterViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/16/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JobsiteViewController.h"
#import "NewMedicalViewController.h"
#import "RaceViewController.h"
#import "EmployeeViewController.h"
#import "CourseDrugViewController.h"
#import "UploadImageViewController.h"
#import "DocumentsViewController.h"
#import "ShowDocViewController.h"
#import "Validation.h"
#import "sqlite3.h"
#import "UserDetails.h"
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
@property (strong, nonatomic)UITabBarController*tabbarcntrl;
@property(strong,nonatomic)Validation *val;
@property(strong,nonatomic)UserDetails *userdetails;
@property(strong,nonatomic)NSString *SqlSSnstrng;
/*For Sqlite Database*/

@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3*newEmplyhrListDB;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *Availablityresult;

@property (strong, nonatomic)NSMutableArray *sqliteArray;


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
-(void)processLogout:(NSNotification *)aNotification;
- (IBAction)cancelbtn_iphone:(id)sender;

- (IBAction)cancelbtn:(id)sender;
- (IBAction)homebtn:(id)sender;

@end
