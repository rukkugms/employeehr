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
    self.navigationItem.hidesBackButton=YES;
    //[self.navigationController.navigationBar setHidden:YES];
    [[UIApplication sharedApplication]setStatusBarHidden:YES withAnimation:UIStatusBarAnimationNone];
    [self prefersStatusBarHidden];
    [self setNeedsStatusBarAppearanceUpdate];
   [self.navigationController setNavigationBarHidden:YES animated:YES];
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  // [self.navigationController.navigationBar setHidden:NO];
//    UIBarButtonItem *logoutbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"logout1"] style:UIBarButtonItemStylePlain target:self action:@selector(logoutAction)];
//    
//    
//    NSArray *buttons=[[NSArray alloc]initWithObjects:logoutbutton,nil];
//    [self.navigationItem setRightBarButtonItems:buttons animated:YES];
  
    [self Checknetavailabilty];
    
    
}
-(void)Checknetavailabilty{
    /* for checking Connectivity*/
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    _Availablityresult = [[NSString alloc] init];
    _Availablityresult = ( URLString != NULL ) ? @"Yes" : @"No";
    NSLog(@"Internet connection availability : %@", _Availablityresult);
    
    
}

-(void)logoutAction{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"LOGOUT" message:@"Really Logout?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    
    
    if ([alertView.message isEqualToString:@"Really Logout?"]) {
        
        
        
        if (buttonIndex==0) {
        
        
        [self.navigationController popToRootViewControllerAnimated:YES];
        
    }
    }
    
}


#pragma mark - ipad Button Actions


- (IBAction)registerbtn:(id)sender {
    
    
   
        _registerVCtrl=[[RegisterViewController alloc]initWithNibName:@"RegisterViewController" bundle:nil];
    
    _registerVCtrl.Availablityresult=_Availablityresult;
    [self.navigationController pushViewController:_registerVCtrl animated:YES];
}

- (IBAction)employee:(id)sender {
//    if (!self.loginVCtrl) {
//        _loginVCtrl=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
//    }
//    [self.navigationController pushViewController:_loginVCtrl animated:YES];
    
}

- (IBAction)Alreadyregistered:(id)sender {
    
    if (!self.loginVCtrl) {
        _loginVCtrl=[[LoginViewController alloc]initWithNibName:@"LoginViewController" bundle:nil];
    }
    _loginVCtrl.Availablityresult=_Availablityresult;
    [self.navigationController pushViewController:_loginVCtrl animated:YES];
    
    
}





#pragma mark - ipone Button Actions

- (IBAction)registerbtn_iphone:(id)sender {
    
    if (!self.registerVCtrl) {
        _registerVCtrl=[[RegisterViewController alloc]initWithNibName:@"RegisterViewController_iphone" bundle:nil];
    }
    [self.navigationController pushViewController:_registerVCtrl animated:YES];
}

- (IBAction)Alreadyregisterd_iphone:(id)sender {
    
    if (!self.loginVCtrl) {
        _loginVCtrl=[[LoginViewController alloc]initWithNibName:@"LoginViewController_iphone" bundle:nil];
    }
       _loginVCtrl.Availablityresult=_Availablityresult;
    [self.navigationController pushViewController:_loginVCtrl animated:YES];

}

- (IBAction)employee_iphone:(id)sender {
}
@end
