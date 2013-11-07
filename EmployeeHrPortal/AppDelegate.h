//
//  AppDelegate.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/5/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KontractViewController.h"
@class ViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) ViewController *viewController;
@property (strong, nonatomic)KontractViewController*konrtctVCtrl;

@property(strong,nonatomic)UINavigationController*navgtioncontroller;

@end
