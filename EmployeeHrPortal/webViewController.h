//
//  webViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia 2 on 18/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface webViewController : UIViewController<UIWebViewDelegate>
@property (strong, nonatomic) IBOutlet UIWebView *webview;
@property(strong,nonatomic)NSString*docpdf;
@property(strong,nonatomic)IBOutlet UIActivityIndicatorView *activity;

@end
