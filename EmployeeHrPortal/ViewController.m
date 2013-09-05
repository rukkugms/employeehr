//
//  ViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/5/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    self.title=NSLocalizedString(@"Employee Portal", @"Employee Portal");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerbtn:(id)sender {
    
    
    if (!self.registerVCtrl) {
        _registerVCtrl=[[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    }
    [self.navigationController pushViewController:_registerVCtrl animated:YES];
}

- (IBAction)employee:(id)sender {
    if (!self.loginVCtrl) {
        _loginVCtrl=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    }
    [self.navigationController pushViewController:_loginVCtrl animated:YES];
    
}

- (IBAction)Alreadyregistered:(id)sender {
    
    if (!self.loginVCtrl) {
        _loginVCtrl=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    }
    [self.navigationController pushViewController:_loginVCtrl animated:YES];
    
    
}

@end
