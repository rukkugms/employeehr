//
//  SecondRaceViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/11/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "racemdl.h"
@interface SecondRaceViewController : UIViewController{
    BOOL recordResults;
}

@property(strong,nonatomic)racemdl*racemdl1;
/*xmlparser*/

@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UISegmentedControl *agencysgmnt;
@property (strong, nonatomic) IBOutlet UISegmentedControl *campaignsgmt;

@property (strong, nonatomic) IBOutlet UISegmentedControl *Affirmatvesgmt;

@property (strong, nonatomic) IBOutlet UISegmentedControl *activedutysgmnt;

@property (strong, nonatomic) IBOutlet UISegmentedControl *reservistsgmnt;
@property (strong, nonatomic) IBOutlet UISegmentedControl *departmentsgmnt;
@property (strong, nonatomic) IBOutlet UISegmentedControl *seperatedsegmnt;


@property(readwrite)NSInteger IsProtectedVeteranValue;
@property(readwrite)NSInteger IsDisablevalue;
@property(readwrite)NSInteger IsVietnamEravalue;
@property(readwrite)NSInteger IsActiveReservistvalue;
@property(readwrite)NSInteger IsDisabledVeteranvalue;
@property(readwrite)NSInteger IsSeperatedVeteranvalue;


- (IBAction)submitbtn:(id)sender;

@end
