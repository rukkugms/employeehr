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
@interface CourseDrugViewController : UIViewController{
    NSInteger selectedcell;
     BOOL recordResults;
     NSInteger Poptype;
    UIButton *button;
     UIButton *yearbutton;
    NSInteger path;
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


@end
