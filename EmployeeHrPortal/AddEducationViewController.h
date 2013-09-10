//
//  AddEducationViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddEducationViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>{
    BOOL recordResults;
   
}

@property (strong, nonatomic) IBOutlet UIButton *edunamelbl;
@property (strong, nonatomic) IBOutlet UITextField *yrstxtfld;

@property (strong, nonatomic) IBOutlet UITextField *institutenametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetxtfld;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIPickerView *edupicker;

- (IBAction)savebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)eduname:(id)sender;
-(IBAction)returnkey:(id)sender;


/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*arrays*/
@property(readwrite) NSInteger Applicantid;
@property(strong,nonatomic)NSMutableArray*edunamearray;
@end
