//
//  RaceViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/26/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ethicity.h"

@interface RaceViewController : UIViewController
{
    BOOL recordResults;
    BOOL buttonclicked;

}
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;

@property(strong,nonatomic)Ethicity *ethmdl;
@property(readwrite)NSInteger applicantId;
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


@property(strong,nonatomic)IBOutlet UISegmentedControl *isconvictSegment;
@property(strong,nonatomic)IBOutlet UITextField *convictExplanationText;
@property(strong,nonatomic)IBOutlet UITextField *twicnumberText;
@property(strong,nonatomic)IBOutlet UISegmentedControl *agelimitsegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *legalsrightssegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *workovertimesegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *workedearliersegment;
@property(strong,nonatomic)IBOutlet UITextField *workedperiodText;
@property(strong,nonatomic)IBOutlet UISegmentedControl *workoutoftownSegment;

@property(strong,nonatomic)IBOutlet UITextField *refferedagencyText;
@property(strong,nonatomic)IBOutlet UISegmentedControl *IsProtectedVeteransegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *isdisableSegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *IsVietnamEraSegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *IsActiveReservistSegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *IsDisabledVeteranSegment;
@property(strong,nonatomic)IBOutlet UISegmentedControl *IsSeperatedVeteranSegment;

-(IBAction)submitAction:(id)sender;

//segmentvalues

@property(readwrite)NSInteger isconvictvalue;
@property(readwrite)NSInteger agelimitvalue;
@property(readwrite)NSInteger legalrightsvalue;
@property(readwrite)NSInteger workedovertimevalue;
@property(readwrite)NSInteger workedearliervalue;
@property(readwrite)NSInteger workoutoftownvalue;
@property(readwrite)NSInteger IsProtectedVeteranValue;
@property(readwrite)NSInteger IsDisablevalue;
@property(readwrite)NSInteger IsVietnamEravalue;
@property(readwrite)NSInteger IsActiveReservistvalue;
@property(readwrite)NSInteger IsDisabledVeteranvalue;
@property(readwrite)NSInteger IsSeperatedVeteranvalue;
@property(strong,nonatomic)NSString *reffer;
@property(strong,nonatomic)UIPopoverController *popOverController1;
@property(strong,nonatomic)UITableView *popOverTableView;


@property(strong,nonatomic)IBOutlet UIButton *refferbtn;


-(IBAction)selectreffer:(id)sender;

//array

@property(strong,nonatomic)NSMutableArray *refferArray;
@end
