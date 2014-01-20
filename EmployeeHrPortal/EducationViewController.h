//
//  EducationViewController.h
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/9/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "CKCalendarView.h"
#import "certificateModel.h"
#import "Educationdetails.h"
#import "AddEducationViewController.h"
#import "sqlite3.h"
///#import "NewMedicalViewController.h"
@interface EducationViewController : UIViewController<UITextFieldDelegate>
{
     BOOL recordResults;
    NSInteger webtype;
     NSInteger identifr;
}

/*For Sqlite Database*/
@property(strong,nonatomic) NSString *docsDir;
@property(strong,nonatomic) NSArray *dirPaths;
@property(nonatomic,readwrite) sqlite3*newEmplyhrListDB;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSString *Availablityresult;
@property(strong,nonatomic)NSString *sqlitessn;

@property(strong,nonatomic)NSString*eduview;
@property(strong,nonatomic)NSString*cerview;

//@property(strong,nonatomic)NewMedicalViewController *newmedVCtrl;
@property(readwrite)NSInteger Applicantid;
@property(nonatomic, weak) CKCalendarView *calendar;
@property(nonatomic, strong) NSDateFormatter *dateFormatter;

@property(strong,nonatomic)UIPopoverController *popOverController;
@property(strong,nonatomic)UITableView *popOverTableView;
@property(strong,nonatomic)certificateModel*cerifcteml;
@property(strong,nonatomic)NSMutableArray*certifctearray;
//@property(strong,nonatomic)NSDictionary*certifictedict;
@property(strong,nonatomic)Educationdetails*Edumodel;
@property(strong,nonatomic)NSMutableArray*eduarray;
@property(strong,nonatomic)NSMutableArray*edunamearray;


/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;


/*Outlets*/
@property(strong,nonatomic)IBOutlet UIScrollView *scroll;
@property(strong,nonatomic)IBOutlet UITableView *educationtable;
@property(strong,nonatomic)IBOutlet UITableView *certificatetable;
@property (strong, nonatomic) IBOutlet UIView *view1;
@property (strong, nonatomic) IBOutlet UIView *view2;
@property (strong, nonatomic) IBOutlet UIButton *edunamebtnlbl;
@property (strong, nonatomic) IBOutlet UITextField *yearscompleted;
@property (strong, nonatomic) IBOutlet UITextField *insitutionname;
@property (strong, nonatomic) IBOutlet UITextField *citytxtfld;
@property (strong, nonatomic) IBOutlet UITextField *statetxtfld;
@property (strong, nonatomic) IBOutlet UITextField *certifcatenametxt;
@property (strong, nonatomic) IBOutlet UIButton *certificatedatebtnlbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *certificatecell;
@property (strong, nonatomic) IBOutlet UILabel *Cnamelbl;
@property (strong, nonatomic) IBOutlet UILabel *cdatelbl;
@property (strong, nonatomic) IBOutlet UITableViewCell *educell;
@property (strong, nonatomic) IBOutlet UILabel *edunamelbl;
@property (strong, nonatomic) IBOutlet UILabel *yearslbl;
@property (strong, nonatomic) IBOutlet UILabel *institutelbl;
@property (strong, nonatomic) IBOutlet UILabel *citylbl;
@property (strong, nonatomic) IBOutlet UILabel *statelbl;



- (IBAction)selecteducationbtn:(id)sender;

- (IBAction)closebutn:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *deleteedubtn;

- (IBAction)Addeduction:(id)sender;
- (IBAction)Addcertificate:(id)sender;
- (IBAction)certificataeclsebtn:(id)sender;
- (IBAction)datebtn:(id)sender;
- (IBAction)savebtn:(id)sender;
- (IBAction)cancelbtn:(id)sender;
- (IBAction)edusavebtn:(id)sender;
- (IBAction)educancelbtn:(id)sender;
- (IBAction)deleteedubtn:(id)sender;
- (IBAction)certdeletebtn:(id)sender;
-(IBAction)continueAction:(id)sender;

/*iphone outlets&Connections*/
@property(strong,nonatomic)AddEducationViewController*AddeduVCtrl;
@property (strong, nonatomic) IBOutlet UIScrollView *scroll_iphone;

@property (strong, nonatomic) IBOutlet UILabel *namelbl_iphone;
@property (strong, nonatomic) IBOutlet UILabel *yearlbl_iphone;

@property (strong, nonatomic) IBOutlet UITableViewCell *_educell_iphone;
@property (strong, nonatomic) IBOutlet UITableView *edutable_iphone;

@property (strong, nonatomic) IBOutlet UITableView *certtable_iphone;
- (IBAction)Addedu_iphone:(id)sender;
- (IBAction)Addcert_iphone:(id)sender;
- (IBAction)deleteedu_iphone:(id)sender;
- (IBAction)deletecert_iphone:(id)sender;

@end
