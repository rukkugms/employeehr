//
//  AddEducationViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface AddEducationViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate>{
    BOOL recordResults;
   
}
/*sqlite*/
@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3*newEmplyhrListDB;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *Availablityresult;
@property(strong,nonatomic)NSString *sqlitessn;
@property(strong,nonatomic)NSString *applicantssn;

@property(strong,nonatomic)NSString*eduview;
@property(strong,nonatomic)NSString*cerview;
@property (strong, nonatomic) IBOutlet UIButton *edunamelbl;
@property (strong, nonatomic) IBOutlet UITextField *yrstxtfld;

@property (strong, nonatomic) IBOutlet UITextField *institutenametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetxtfld;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIPickerView *edupicker;
@property (strong, nonatomic) IBOutlet UIDatePicker *datepicker;
@property (strong, nonatomic) IBOutlet UIView *view2;

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
@property (strong, nonatomic) IBOutlet UITextField *name;
@property (strong, nonatomic) IBOutlet UIButton *date;
- (IBAction)savecer:(id)sender;
- (IBAction)cancelcer:(id)sender;

- (IBAction)cerdatebtn:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *cerdatetxtfld;

@end
