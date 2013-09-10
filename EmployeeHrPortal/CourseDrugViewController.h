//
//  CourseDrugViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 8/19/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "Coursemdl.h"
#import "RaceViewController.h"
@interface CourseDrugViewController : UIViewController<UIPickerViewDelegate,UIPickerViewDataSource>
{
    NSInteger selectedcell;
     BOOL recordResults;
     NSInteger Poptype;
    UIButton *button;
     UIButton *yearbutton;
    UIButton *monthbtn_iphone;
    UIButton *yearbtn_iphone;
    NSInteger path;
    NSString *pickerstring;
}
@property (strong, nonatomic) IBOutlet UITableView *detailstable;
@property(readwrite)NSInteger Applicantid;
@property(strong,nonatomic)NSString*jobsiteid;
@property(strong,nonatomic)NSString *craftid;
@property(strong,nonatomic)NSString *selectedcellstring;
@property (strong, nonatomic) IBOutlet UITableViewCell *detailcell;
@property (strong, nonatomic) IBOutlet UILabel *requirmentlbl;
@property (strong, nonatomic)Coursemdl*coursemdl;
@property(strong,nonatomic)RaceViewController *raceVCtrl;
/*xmlparse*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

- (IBAction)continuebtn:(id)sender;
-(IBAction)selectMonth:(id)sender;
-(IBAction)selectyear:(id)sender;
@property(strong,nonatomic)IBOutlet UIButton *monthbtn;
@property(strong,nonatomic)IBOutlet UIButton *yearbtn;

@property (strong, nonatomic) IBOutlet UILabel *codelbl;

@property(strong,nonatomic)NSMutableArray *yearArray;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;

/*Arrays&dictionaries*/

@property(strong,nonatomic)NSMutableArray *monthArray;
@property(strong,nonatomic)NSMutableArray *monthdictArray;

@property(strong,nonatomic)NSMutableArray *requirementArray;
@property(strong,nonatomic)NSMutableDictionary *monthDictionary;
@property(strong,nonatomic)NSMutableDictionary *remonthDictionary;
//iphone
@property(strong,nonatomic)IBOutlet UIScrollView *scroll_iphone;
@property(strong,nonatomic)IBOutlet UITableView *reqtable_iphone;
@property(strong,nonatomic)IBOutlet UITableViewCell *reqcell_iphone;
@property(strong,nonatomic)IBOutlet UILabel *reqlabel_iphone;
@property(strong,nonatomic)IBOutlet UIButton *month_iphone;
@property(strong,nonatomic)IBOutlet UIButton *year_iphone;

@property(strong,nonatomic)IBOutlet UIPickerView *monthpicker_iphone;
@property(strong,nonatomic)IBOutlet UIPickerView *yearpicker_iphone;

-(IBAction)selectmonth_iphone:(id)sender;
-(IBAction)selectyear_iphone:(id)sender;
-(IBAction)update_iphone:(id)sender;
-(IBAction)cancel_iphone:(id)sender;


@end
