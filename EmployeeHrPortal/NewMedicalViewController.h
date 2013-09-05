//
//  NewMedicalViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 8/1/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Medicalmodel.h"
#import <QuartzCore/QuartzCore.h>
#import "EmployeeViewController.h"

@interface NewMedicalViewController : UIViewController{
    BOOL  recordResults;
    NSInteger identifier;
    NSInteger webtype;
}


//@property(strong,nonatomic)FirstViewController*firstVctrl;
@property(readwrite)NSInteger Applicantid;
@property(strong,nonatomic)EmployeeViewController*emplyeeVCtrl;
@property (strong, nonatomic) IBOutlet UILabel *meddescptnlbl;

@property (strong, nonatomic) IBOutlet UILabel *medicalnamelbl;
@property (strong, nonatomic) IBOutlet UITextField *meddistxtfld;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UITableViewCell *medicalcell;
@property(strong,nonatomic)NSString*unitstrg;
@property (strong, nonatomic) IBOutlet UITableView *medicaltable;
@property (strong, nonatomic)Medicalmodel*medmdl;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
@property (strong, nonatomic) IBOutlet UIButton *medicalconditinbtnlbl;

@property (strong, nonatomic) IBOutlet UITextField *medicaldistxtfld;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;
/*Arrays*/
@property(strong,nonatomic)NSMutableArray*applicantmedicalcntnarray;
@property(strong,nonatomic)NSArray*medicalnamearray;
@property(strong,nonatomic)NSMutableDictionary*medicalnamedict;
@property(strong,nonatomic)NSMutableDictionary*medicaliddict;

@property (strong, nonatomic) IBOutlet UISegmentedControl *medicationsegment;

@property (strong, nonatomic) IBOutlet UITextField *medicationtxtfld;

@property (strong, nonatomic) IBOutlet UISegmentedControl *climbingsegment;

- (IBAction)Addbtn:(id)sender;
- (IBAction)savebtn:(id)sender;
- (IBAction)medcntdnbtn:(id)sender;
- (IBAction)closebtn:(id)sender;
- (IBAction)continuebtn:(id)sender;
- (IBAction)deletebtn:(id)sender;
- (IBAction)firstpage:(id)sender;

@end
