//
//  BasicdetailsViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/8/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EducationViewController.h"
#import "CKCalendarView.h"
@interface BasicdetailsViewController : UIViewController{
    BOOL recordResults;
    NSInteger genderstg;
    NSInteger popovertype;
}
@property(readwrite)NSInteger Applicantid;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)EducationViewController*educationVCtrl;

/*Arrays*/
@property(strong,nonatomic)NSMutableArray*suffixarray;
@property(strong,nonatomic)NSMutableArray *stateArray;
/*Outlets*/
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property(strong,nonatomic)IBOutlet UIImageView *imgvw;
@property (strong, nonatomic) IBOutlet UIButton *sufixbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *lastnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *firstnametxtfld;
@property (strong, nonatomic) IBOutlet UITextField *Addresstxtfld;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UIButton *statebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *ziptextflield;
@property (strong, nonatomic) IBOutlet UITextField *ssntxtfld;
@property (strong, nonatomic) IBOutlet UIButton *dobbtnlbl;
@property (strong, nonatomic) IBOutlet UIButton *countrybtnlbl;
@property (strong, nonatomic) IBOutlet UISegmentedControl *gendersegmentcntrl;
@property (strong, nonatomic) IBOutlet UITextField *emailtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *mobiletxtfld;
@property (strong, nonatomic) IBOutlet UITextField *homenumbertxtfld;
@property (strong, nonatomic) IBOutlet UITextField *alternativenumtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *emergencytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *contactnumbtxtfld;
@property (strong, nonatomic) IBOutlet UITextField *driverlicencetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *stateissuetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *nameinlicencetxtfld;




/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*Buttons*/
- (IBAction)suffixbtn:(id)sender;
- (IBAction)statebtn:(id)sender;
- (IBAction)countrybtn:(id)sender;
- (IBAction)dobbtn:(id)sender;
- (IBAction)gendersegmentcntrl:(id)sender;
- (IBAction)continuebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;

@end
