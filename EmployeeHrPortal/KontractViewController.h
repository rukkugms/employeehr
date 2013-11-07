//
//  KontractViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 11/7/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface KontractViewController : UIViewController{
    BOOL recordResults;
}
@property(strong,nonatomic)NSString*fromid;
@property(strong,nonatomic)UITabBarController*tabbarCntrl;
//@property(strong,nonatomic)UsersViewController*userVctrl;
/*xmlparse*/
@property(strong,nonatomic)NSMutableString*Soapresults;
@property(strong,nonatomic)NSXMLParser*xmlParser;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic) IBOutlet UITextField *usertxtfld;
@property (strong, nonatomic) IBOutlet UITextField *passwrdtxtfld;
@property(strong,nonatomic)NSMutableDictionary*usernamedict;

@property (strong, nonatomic) ViewController *vCtroller;
- (IBAction)login_ipad:(id)sender;
- (IBAction)login_iphone:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *usernametext_iphone;
@property (strong, nonatomic) IBOutlet UITextField *passwordtext_iphone;
-(IBAction)returnkey:(id)sender;

@end
