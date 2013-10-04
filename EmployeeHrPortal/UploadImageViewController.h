//
//  UploadImageViewController.h
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/18/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface UploadImageViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    BOOL recordResults;
}
@property(readwrite)NSInteger Applicantid;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollview;
@property (strong, nonatomic) IBOutlet UIImageView *imageview;

/*Xmlparser*/
@property(strong,nonatomic)NSXMLParser *xmlParser;
@property(strong,nonatomic)NSMutableString *soapResults;
@property(strong,nonatomic)NSMutableData *webData;

/*cameraAction*/
@property (nonatomic) BOOL newMedia;
@property(strong,nonatomic)NSData*basedata;
@property(strong,nonatomic)NSString*encodedString;


- (IBAction)upload:(id)sender;

@end
