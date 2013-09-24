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
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface BasicdetailsViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIPopoverControllerDelegate,UITextFieldDelegate>
{
    BOOL recordResults;
    NSInteger upint;
    NSInteger genderstg;
    NSInteger popovertype;
    //iphone
    NSInteger detailbtnclicked_iphone;
    NSString *pickerstring;
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
@property(strong,nonatomic)IBOutlet UIDatePicker *datepicker_ipad;
@property(strong,nonatomic)IBOutlet UITextField *datetextfld_ipad;


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


/*for iphone*/
@property(strong,nonatomic)IBOutlet UIScrollView *scroll_iphone;
@property(strong,nonatomic)IBOutlet UIView *contactinfoview_iphone;
@property(strong,nonatomic)IBOutlet UIButton *infobtn_iphone;
@property(strong,nonatomic)IBOutlet UIButton *suffixbtn_iphone;
@property(strong,nonatomic)IBOutlet UIPickerView *suffixpicker;
@property(strong,nonatomic)IBOutlet UIPickerView *statepicker;
@property(strong,nonatomic)IBOutlet UIButton *statebtn_iphone;
@property(strong,nonatomic)IBOutlet UITextField *lastnametxt_iphone;
@property(strong,nonatomic)IBOutlet UITextField *firstnametxt_iphone;
@property(strong,nonatomic)IBOutlet UITextField *homeaddresstxt_iphone;
@property(strong,nonatomic)IBOutlet UITextField *ziptxt_iphone;
@property(strong,nonatomic)IBOutlet UITextField *ssntextfield_iphone;
@property(strong,nonatomic)IBOutlet UITextField *dobtext_iphone;
@property(strong,nonatomic)IBOutlet UIButton *countrytxt_iphone;
@property(strong,nonatomic)IBOutlet UIDatePicker *datepicker_iphone;
@property(strong,nonatomic)IBOutlet UISegmentedControl *gendersegment_iphone;
@property(strong,nonatomic)IBOutlet UITextField *citytxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *emailtxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *mobilenotext_iphone;
@property (strong, nonatomic) IBOutlet UITextField *homenotxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *alternatenotxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *emergencycontactnametxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *contactnotxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *drivinglicenceno_iphone;
@property (strong, nonatomic) IBOutlet UITextField *stateissuetxt_iphone;
@property (strong, nonatomic) IBOutlet UITextField *nameonlicenct_iphone;
 
//array
@property(strong,nonatomic)NSMutableArray *suffixarray_iphone;


//actions

- (IBAction)detailbtn_iphone:(id)sender;
-(IBAction)textFieldReturn:(id)sender;
-(IBAction)selectsuffix_iphone:(id)sender;
-(IBAction)selectstate_iphone:(id)sender;
-(IBAction)update_iphone:(id)sender;
-(IBAction)cancel_iphone:(id)sender;



/*cameraAction*/
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;

@property(strong,nonatomic)IBOutlet UIImageView *imgvw;
- (IBAction)uploadimage:(id)sender;


@end
