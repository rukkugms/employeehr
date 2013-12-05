//
//  webViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia 2 on 18/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "webViewController.h"

@interface webViewController ()

@end

@implementation webViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:_webview];
    _activity=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    UIBarButtonItem*barbutton=[[UIBarButtonItem alloc]initWithCustomView:_activity];
    
    
    [self.navigationItem setRightBarButtonItem:barbutton];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *header=@"http://";
    NSString *urlstring=[NSString stringWithFormat:@"%@%@",header,_docpdf];
    
    NSLog(@"reportname%@",urlstring);
    NSURL *targetURL = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];

    [_webview loadRequest:request];
    
    
//    [self.view addSubview:_webview];
}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    [_activity startAnimating];
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activity stopAnimating];
    _activity.hidden=YES;
    
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
NSLog(@"ef%@",error);
    
}



@end
