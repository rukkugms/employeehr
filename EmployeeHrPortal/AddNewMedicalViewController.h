//
//  AddNewMedicalViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/9/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNewMedicalViewController : UIViewController{
    BOOL recordResults ;
    NSInteger Applicantid;
    NSInteger webtype;
}

/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*outlets*/
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property (strong, nonatomic) IBOutlet UIButton *medcndtnbtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *descptntxtfld;

/*Arrays&Dictionaries*/
@property (strong, nonatomic)NSString*unitsring;
@property(strong,nonatomic)NSMutableDictionary* _medicalnamedict;
@property(strong,nonatomic)NSMutableDictionary*_medicaliddict;
@property(strong,nonatomic)NSArray* medicalnamearray;


- (IBAction)medicalcndtnbtn:(id)sender;
- (IBAction)savebtn:(id)sender;
-(IBAction)returnkey:(id)sender;

@end
