//
//  DocumentsViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 10/18/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "UploadDocViewController.h"
@interface DocumentsViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIWebViewDelegate>{
    BOOL recordResults;

}


@property(readwrite)NSInteger applicantid;
@property(strong,nonatomic)NSString*Unitstring;
@property(strong,nonatomic)UploadDocViewController*uploadVCtrl;

/*Dictionary*/

@property(strong,nonatomic)NSMutableDictionary*DocumentDictionary;
 
/*Arrays*/
@property(strong,nonatomic)NSArray*DoculistArray;

/*xml parser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;
/*Outlets*/
@property (strong, nonatomic) IBOutlet UITableView *Docmnttable;
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property(strong,nonatomic) IBOutlet UIActivityIndicatorView*activityndictr;


/*Actions*/
- (IBAction)Adddocbtn:(id)sender;


@end
