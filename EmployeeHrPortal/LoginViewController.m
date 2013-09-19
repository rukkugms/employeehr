//
//  LoginViewController.m
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/16/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.title=NSLocalizedString(@"Login", @"Login");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
      self.navigationItem.hidesBackButton=YES;
     [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processhome:) name:@"home" object:nil];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)processhome:(NSNotification *)aNotification{
    [self.navigationController popToViewController:self.firstVCtrl animated:YES];
     //[NSUserDefaults standardUserDefaults]
     }
#pragma mark - Textfield Delegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        
                if (textField==_passwordtxtfld) {
            
        
        ssnstring=_ssntxtfld.text;
                    
                    
                            //checking a particular charector
        // NSString *connectstring;
        NSString*new=[ssnstring substringWithRange:NSMakeRange(3, 1)];
        NSString*new1=[ssnstring substringWithRange:NSMakeRange(6, 1)];
        
        
        
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *resultString = [[ssnstring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        NSLog (@"Result: %@", resultString);
        
                    if ([resultString length]==9) {
                        
                        
                        
                    

        
        if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
            _connectstring=resultString;
        }
        
        
        
        
        
        else {
            
            
            
            
            NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
            NSLog(@"%@",subString);
            NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,2)];
            NSLog(@"%@",substring2);
            NSString *substring3=[resultString  substringWithRange:NSMakeRange(5,4)];
            NSLog(@"%@",substring3);
            _connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
            NSLog(@"%@",_connectstring);
            _ssntxtfld.text=_connectstring;
            
        }

                    }
                    
                    
                    
                    else{
                        
                        
                        
                        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                        
                        [alert show];
                        
                    }
        
        }
    }

    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        
        ssnstring=_SSNtxtfld_iphone.text;
        //checking a particular charector
        // NSString *connectstring;
        NSString*new=[ssnstring substringWithRange:NSMakeRange(3, 1)];
        NSString*new1=[ssnstring substringWithRange:NSMakeRange(6, 1)];
        
        
        
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *resultString = [[ssnstring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        NSLog (@"Result: %@", resultString);
        
          if ([resultString length]==9) {
        
        if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
            _connectstring=resultString;
        }
        
        
        
        
        
        else {
            
            
            
            
            NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
            NSLog(@"%@",subString);
            NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,2)];
            NSLog(@"%@",substring2);
            NSString *substring3=[resultString  substringWithRange:NSMakeRange(5,4)];
            NSLog(@"%@",substring3);
            _connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
            NSLog(@"%@",_connectstring);
            _SSNtxtfld_iphone.text=_connectstring;
            
        }
              
          }
          else{
              
              
              
              UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
              
              [alert show];
              
          }

        
        
    }
        return YES;
    }







#pragma mark - Webservice
/*webservices*/

-(void)GetApplicantId1{
    
    
    NSLog(@"length%d",[_connectstring length]);
      recordResults = FALSE;
    NSString *soapMessage;
     if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
         
                
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetApplicantId1 xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<ApplicantSSN>%@</ApplicantSSN>\n"
                   "<Password>%@</Password>\n"
                   "</GetApplicantId1>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_connectstring,_passwordtxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/GetApplicantId1" forHTTPHeaderField:@"Soapaction"];
    
    [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
    [theRequest setHTTPMethod:@"POST"];
    [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    
    if( theConnection )
    {
        _webData = [NSMutableData data];
    }
    else
    {
        ////NSLog(@"theConnection is NULL");
    }
     }
    
     else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        
         
         soapMessage = [NSString stringWithFormat:
                        
                        @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                        "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                        
                        
                        "<soap:Body>\n"
                        
                        "<GetApplicantId1 xmlns=\"http://webserv.kontract360.com/\">\n"
                        "<ApplicantSSN>%@</ApplicantSSN>\n"
                        "<Password>%@</Password>\n"
                        "</GetApplicantId1>\n"
                        "</soap:Body>\n"
                        "</soap:Envelope>\n",_connectstring,_passwordtxtfld_iphone.text];
         NSLog(@"soapmsg%@",soapMessage);
         
         
         // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
         NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
         
         NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
         
         NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
         
         [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
         
         [theRequest addValue: @"http://webserv.kontract360.com/GetApplicantId1" forHTTPHeaderField:@"Soapaction"];
         
         [theRequest addValue: msgLength forHTTPHeaderField:@"Content-Length"];
         [theRequest setHTTPMethod:@"POST"];
         [theRequest setHTTPBody: [soapMessage dataUsingEncoding:NSUTF8StringEncoding]];
         
         
         NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
         
         if( theConnection )
         {
             _webData = [NSMutableData data];
         }
         else
         {
             ////NSLog(@"theConnection is NULL");
         }

         
         
         
         
     }
    
    
    
    
}
#pragma mark - Connection
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
	[_webData setLength: 0];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
   	[_webData appendData:data];
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    UIAlertView *  Alert=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"ERROR with theConenction" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
    
    [Alert show];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"DONE. Received Bytes: %d", [_webData length]);
	NSString *theXML = [[NSString alloc] initWithBytes: [_webData mutableBytes] length:[_webData length] encoding:NSUTF8StringEncoding];
	NSLog(@"xml===== %@",theXML);
	
	
	if( _xmlParser )
	{
		
	}
	
	_xmlParser = [[NSXMLParser alloc] initWithData: _webData];
	[_xmlParser setDelegate:(id)self];
	[_xmlParser setShouldResolveExternalEntities: YES];
	[_xmlParser parse];
    
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    
    if([elementName isEqualToString:@"applicant_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
}
-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    
    
    
	if( recordResults )
        
	{
        
        
		[_soapResults appendString: string];
    }
}
-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    if([elementName isEqualToString:@"applicant_Id"])
    {
        
        recordResults = FALSE;
        Applicantid=[_soapResults integerValue];
              
//        if (!self.firstVCtrl) {
//            _firstVCtrl=[[JobsiteViewController alloc]initWithNibName:@"JobsiteViewController" bundle:nil];
//        }
//       // _firstVCtrl.Applicantid=Applicantid;
//        [self.navigationController pushViewController:_firstVCtrl animated:YES];
        
        
        
/*Code for tabbarcontroller*/
        
        
         if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        _tabbarcntrl=[[UITabBarController alloc]init];
          _tabbarcntrl.tabBar.tintColor=[[UIColor alloc]initWithRed:0.22 green:0.33 blue:0.52 alpha:1];
    
    BasicdetailsViewController *viewController2 = [[BasicdetailsViewController alloc] initWithNibName:@"BasicdetailsViewController" bundle:nil];
        viewController2.Applicantid=Applicantid;
    EducationViewController *viewController3 = [[EducationViewController alloc] initWithNibName:@"EducationViewController" bundle:nil];
        viewController3.Applicantid=Applicantid;
        JobsiteViewController *viewController1 = [[JobsiteViewController alloc] initWithNibName:@"JobsiteViewController" bundle:nil];
        viewController1.Applicantid=Applicantid;
         NewMedicalViewController *viewController4 = [[ NewMedicalViewController alloc] initWithNibName:@"NewMedicalViewController" bundle:nil];
        viewController4.Applicantid=Applicantid;
        EmployeeViewController*viewcontroller5=[[EmployeeViewController alloc]initWithNibName:@"EmployeeViewController" bundle:nil];
        viewcontroller5.Applicantid=Applicantid;
        CourseDrugViewController*viewcontroller6=[[CourseDrugViewController alloc]initWithNibName:@"CourseDrugViewController" bundle:nil];
        viewcontroller6.Applicantid=Applicantid;
        RaceViewController*viewcontroller7=[[RaceViewController alloc]initWithNibName:@"RaceViewController" bundle:nil];
        viewcontroller7.applicantId=Applicantid;
        NSArray *controllers = [NSArray arrayWithObjects:viewController1,viewController2,viewController3,viewController4,viewcontroller5,viewcontroller6,viewcontroller7,nil];
        self.tabbarcntrl.viewControllers = controllers;
        
        
        [self.navigationController pushViewController:_tabbarcntrl animated:YES];
        
         }
        
         else {
             _tabbarcntrl=[[UITabBarController alloc]init];
             _tabbarcntrl.tabBar.tintColor=[[UIColor alloc]initWithRed:0.22 green:0.33 blue:0.52 alpha:1];
   
             
             BasicdetailsViewController *viewController3 = [[BasicdetailsViewController alloc] initWithNibName:@"BasicdetailsViewController_iphone" bundle:nil];
             viewController3.Applicantid=Applicantid;
             
             UploadImageViewController*viewController2=[[UploadImageViewController alloc]initWithNibName:@"UploadImageViewController" bundle:nil];
             
             EducationViewController *viewController4 = [[EducationViewController alloc] initWithNibName:@"EducationViewController_iphone" bundle:nil];
             viewController4.Applicantid=Applicantid;
             JobsiteViewController *viewController1 = [[JobsiteViewController alloc] initWithNibName:@"JobsiteViewController_iphone" bundle:nil];
             viewController1.Applicantid=Applicantid;
             NewMedicalViewController *viewController5 = [[ NewMedicalViewController alloc] initWithNibName:@"NewMedicalViewController_iphone" bundle:nil];
             viewController5.Applicantid=Applicantid;
             EmployeeViewController*viewcontroller6=[[EmployeeViewController alloc]initWithNibName:@"EmployeeViewController_iphone" bundle:nil];
             viewcontroller6.Applicantid=Applicantid;
             CourseDrugViewController*viewcontroller7=[[CourseDrugViewController alloc]initWithNibName:@"CourseDrugViewController_iphone" bundle:nil];
             viewcontroller7.Applicantid=Applicantid;
             RaceViewController*viewcontroller8=[[RaceViewController alloc]initWithNibName:@"RaceViewController_iphone" bundle:nil];
             viewcontroller8.applicantId=Applicantid;
             NSArray *controllers = [NSArray arrayWithObjects:viewController1,viewController2,viewController3,viewController4,viewController5,viewcontroller6,viewcontroller7,viewcontroller8,nil];
             self.tabbarcntrl.viewControllers = controllers;
             
             
             [self.navigationController pushViewController:_tabbarcntrl animated:YES];

             
         }
        
        
        
        _soapResults = nil;
    }
    
}
#pragma mark -Ipad Action
- (IBAction)loginbtn:(id)sender {
    [self GetApplicantId1];
}

- (IBAction)cancelbtn:(id)sender {
}

#pragma mark -Iphone Actions


- (IBAction)loginbtn_iphone:(id)sender {
    
    
    [self GetApplicantId1];
}
-(IBAction)textfldshouldreturn:(id)sender
{
    [sender resignFirstResponder];
}

@end
