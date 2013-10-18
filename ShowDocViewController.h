//
//  ShowDocViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 10/18/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "webViewController.h"
#import "UploadDocViewController.h"

@interface ShowDocViewController : UIViewController
{
    BOOL recordResults;
     NSString *docsstring;
}
@property(readwrite)NSInteger applicantid;
@property(strong,nonatomic)webViewController *webctrl;
@property(strong,nonatomic)UploadDocViewController *uplodctrl;

@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

@property(strong,nonatomic)IBOutlet UITableView *documenttable;
@property(strong,nonatomic)NSMutableArray *docsarray;
@property(strong,nonatomic)NSMutableDictionary *docspathdict;
@property(strong,nonatomic)NSString *doc;
-(IBAction)adddocument:(id)sender;
@end
