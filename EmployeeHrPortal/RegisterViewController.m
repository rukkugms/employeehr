//
//  RegisterViewController.m
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/16/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "RegisterViewController.h"


@interface RegisterViewController ()

@end

@implementation RegisterViewController

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
    
    _Ssntxtfld.text=@"";
    _passwdtxtfld.text=@"";
    _confirmpasswrd.text=@"";
    self.navigationItem.hidesBackButton=YES;
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    self.navigationController.navigationBar.hidden=YES;
    
    // self.navigationItem.hidesBackButton=YES;
    [ [NSNotificationCenter defaultCenter] addObserver:self selector:@selector(processLogout:) name:@"logout" object:nil];
    
    UIImage *buttonImage = [UIImage imageNamed:@"logout1"];
    UIBarButtonItem *logoutbutton=[[UIBarButtonItem alloc]initWithImage:[buttonImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStyleBordered target:self action:@selector(logoutAction)];
    
    
    NSArray *buttons=[[NSArray alloc]initWithObjects:logoutbutton,nil];
    [self.navigationItem setRightBarButtonItems:buttons animated:YES];
    self.navigationItem.hidesBackButton=YES;
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSTimer *timer;
    timer=[NSTimer scheduledTimerWithTimeInterval:5.0f target:self selector:@selector(Checknetavailabilty) userInfo:nil repeats:YES];
}

-(void)Checknetavailabilty{
    /* for checking Connectivity*/
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    _Availablityresult = [[NSString alloc] init];
    _Availablityresult = ( URLString != NULL ) ? @"Yes" : @"No";
    NSLog(@"Internet connection availability : %@", _Availablityresult);
    if ([_Availablityresult isEqualToString:@"Yes"]) {
       // [self FetchManapowerdatasfromDB];
        
//        if ([_Sqlitearry count]>0) {
//            //[self SynManpowertoserver];
//        }
//        else{
//            //[self Selectallmanpower];
//        }
//        
        
    }
    else if([_Availablityresult isEqualToString:@"No"]){
       // [self Createdatabase];
        //[self FetchManapowerdatasfromDB];
        
        
    }
    
    
    
}

-(void)processLogout:(NSNotification *)aNotification{
    [self.navigationController popToRootViewControllerAnimated:YES];
    //[NSUserDefaults standardUserDefaults]
}

- (IBAction)cancelbtn_iphone:(id)sender {
    _Ssntxtfld_iphone.text=@"";
    _passwdtxtfld_iphone.text=@"";
    _confirmpasswrd_iphone.text=@"";
}

- (IBAction)cancelbtn:(id)sender {
    _Ssntxtfld.text=@"";
    _passwdtxtfld.text=@"";
    _confirmpasswrd.text=@"";
}

- (IBAction)homebtn:(id)sender {
        [self.navigationController popToRootViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)continuebtn:(id)sender {
           
        
    
    ssnstring=_Ssntxtfld.text;
    
    
    if([_Ssntxtfld.text isEqualToString:@""])
    {
        _connectstring=_Ssntxtfld.text;

        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Enter Your SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
        
        [alert show];
        
    }
    NSLog (@"ssnstring length %d", [ssnstring length]);
    
    
    if ([ssnstring length]<9) {
        _connectstring=_Ssntxtfld.text;

        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
        
        [alert show];
        
        
        
    }
    else         {
        ssnstring=_Ssntxtfld.text;
        
        
        //checking a particular charector
        // NSString *connectstring;
        NSString*new=[ssnstring substringWithRange:NSMakeRange(3, 1)];
        NSString*new1=[ssnstring substringWithRange:NSMakeRange(6, 1)];
        
        
        
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *resultString = [[ssnstring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        NSLog (@"Result: %@", resultString);
        
        if ([resultString length]==11) {
            
            
            
            
            
            
            if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                _connectstring=resultString;
            }
            
            
        }
        
        
        if ([resultString length]==9) {
            
            
            
            
            NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
            NSLog(@"%@",subString);
            NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,2)];
            NSLog(@"%@",substring2);
            NSString *substring3=[resultString  substringWithRange:NSMakeRange(5,4)];
            NSLog(@"%@",substring3);
            _connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
            NSLog(@"%@",_connectstring);
            _Ssntxtfld.text=_connectstring;
            
        }
        
        
        
        
        
        else   if ([resultString length]>=10)  {
            
            _connectstring=_Ssntxtfld.text;

            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
            
            [alert show];
            
        }
    }
    
    
    
  







    Validation *val=[[Validation alloc]init];
    int value1=[val isBlank:_Ssntxtfld.text];
    int value2=[val isBlank:_passwdtxtfld.text];
    int value3=[val isBlank:_confirmpasswrd.text];
    if (value1==0||value2==0||value3==0) {
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter Your Social Security Number" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
        }
        
        
        else if(value2==0)
        {
            UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter your Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert2 show];
            
        }
        else if(value3==0)
        {
            UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Confirm your Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert2 show];
            
        }

    }
    
       

   else if ([_passwdtxtfld.text isEqualToString:_confirmpasswrd.text]) {
       
       
       
        [self GetApplicantId2];

        
    }
    else{
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Password does not match" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    
      
    
 }

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
         ssnstring=_Ssntxtfld.text;
        if (textField==_passwdtxtfld) {
            ssnstring=_Ssntxtfld.text;
            
            
            if([_Ssntxtfld.text isEqualToString:@""])
            {
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Enter Your SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            NSLog (@"ssnstring length %d", [ssnstring length]);
            
            
            if ([ssnstring length]<9) {
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                
                [alert show];
                
                
                
            }
            else         {
                ssnstring=_Ssntxtfld.text;
                
                
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[ssnstring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[ssnstring substringWithRange:NSMakeRange(6, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[ssnstring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                
                if ([resultString length]==11) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _connectstring=resultString;
                    }
                    
                    
                }
                
                
                if ([resultString length]==9) {
                    
                    
                    
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,2)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(5,4)];
                    NSLog(@"%@",substring3);
                    _connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_connectstring);
                    _Ssntxtfld.text=_connectstring;
                    
                }
                
                
                
                
                
                else   if ([resultString length]>=10)  {
                    
                    
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
            }
            
    }
    
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
          ssnstring=_Ssntxtfld_iphone.text;
        if (textField==_passwdtxtfld_iphone) {
            
           
            
            
            if([ssnstring isEqualToString:@""])
            {
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Enter Your SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            NSLog (@"ssnstring length %d", [ssnstring length]);
            
            
            if ([ssnstring length]<9) {
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                
                [alert show];
                
                
                
            }
            else         {
                ssnstring=_Ssntxtfld_iphone.text;
                
                
                //checking a particular charector
                // NSString *connectstring;
                NSString*new=[ssnstring substringWithRange:NSMakeRange(3, 1)];
                NSString*new1=[ssnstring substringWithRange:NSMakeRange(6, 1)];
                
                
                
                NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
                NSString *resultString = [[ssnstring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
                NSLog (@"Result: %@", resultString);
                
                if ([resultString length]==11) {
                    
                    
                    
                    
                    
                    
                    if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                        _connectstring=resultString;
                    }
                    
                    
                }
                
                
                if ([resultString length]==9) {
                    
                    
                    
                    
                    NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
                    NSLog(@"%@",subString);
                    NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,2)];
                    NSLog(@"%@",substring2);
                    NSString *substring3=[resultString  substringWithRange:NSMakeRange(5,4)];
                    NSLog(@"%@",substring3);
                    _connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
                    NSLog(@"%@",_connectstring);
                   _Ssntxtfld_iphone.text=_connectstring;
                    
                }
                
                
                
                
                
                else   if ([resultString length]>=10)  {
                    
                    
                    
                    UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                    
                    [alert show];
                    
                }
            }
            
        }
    }
    }
    return YES;
}





#pragma mark - webservice
/*webservices*/

-(void)GetApplicantId{
    webtype=2;
//    ssnstring=_Ssntxtfld.text;
//    NSString *subString = [ssnstring substringWithRange:NSMakeRange(0,3)];
//    NSLog(@"%@",subString);
//    NSString *substring2=[ssnstring substringWithRange:NSMakeRange(3,2)];
//    NSLog(@"%@",substring2);
//    NSString *substring3=[ssnstring substringWithRange:NSMakeRange(5,4)];
//    NSLog(@"%@",substring3);
//    NSString *connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
//    NSLog(@"%@",connectstring);

    recordResults = FALSE;
    NSString *soapMessage;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {

        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_connectstring forKey:@"ssn"];
        [defaults synchronize];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetApplicantId xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<ApplicantSSN>%@</ApplicantSSN>\n"
                   "<Password>%@</Password>\n"
                   "</GetApplicantId>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_connectstring,_confirmpasswrd.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
     // NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/GetApplicantId" forHTTPHeaderField:@"Soapaction"];
    
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
 else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
 {
     NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
     [defaults setObject:_connectstring forKey:@"ssn"];
     [defaults synchronize];
     soapMessage = [NSString stringWithFormat:
                    
                    @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                    "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                    
                    
                    "<soap:Body>\n"
                    
                    "<GetApplicantId xmlns=\"http://arvin.kontract360.com/\">\n"
                    "<ApplicantSSN>%@</ApplicantSSN>\n"
                    "<Password>%@</Password>\n"
                    "</GetApplicantId>\n"
                    "</soap:Body>\n"
                    "</soap:Envelope>\n",_connectstring,_confirmpasswrd_iphone.text];
     NSLog(@"soapmsg%@",soapMessage);
     
     
   NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
      // NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
     
     NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
     
     NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
     
     [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
     
     [theRequest addValue: @"http://arvin.kontract360.com/GetApplicantId" forHTTPHeaderField:@"Soapaction"];
     
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

-(void)GetApplicantId2{
    webtype=1;
//    ssnstring=_Ssntxtfld.text;
//    NSString *subString = [ssnstring substringWithRange:NSMakeRange(0,3)];
//    NSLog(@"%@",subString);
//    NSString *substring2=[ssnstring substringWithRange:NSMakeRange(3,2)];
//    NSLog(@"%@",substring2);
//    NSString *substring3=[ssnstring substringWithRange:NSMakeRange(5,4)];
//    NSLog(@"%@",substring3);
//    NSString *connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
//    NSLog(@"%@",connectstring);

    recordResults = FALSE;
    NSString *soapMessage;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
    {
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<GetApplicantId2 xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<ApplicantSSN>%@</ApplicantSSN>\n"
                   "<Password>%@</Password>\n"
                   "</GetApplicantId2>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_connectstring,_confirmpasswrd.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
  NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
     // NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/GetApplicantId2" forHTTPHeaderField:@"Soapaction"];
    
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
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
    {
        soapMessage = [NSString stringWithFormat:
                       
                       @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                       "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                       
                       
                       "<soap:Body>\n"
                       
                       "<GetApplicantId2 xmlns=\"http://arvin.kontract360.com/\">\n"
                       "<ApplicantSSN>%@</ApplicantSSN>\n"
                       "<Password>%@</Password>\n"
                       "</GetApplicantId2>\n"
                       "</soap:Body>\n"
                       "</soap:Envelope>\n",_connectstring,_confirmpasswrd_iphone.text];
        NSLog(@"soapmsg%@",soapMessage);
        
        
      NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
         // NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
        
        NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
        
        NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
        
        [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
        
        [theRequest addValue: @"http://arvin.kontract360.com/GetApplicantId2" forHTTPHeaderField:@"Soapaction"];
        
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
    if([elementName isEqualToString:@"result"]){
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
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:_soapResults forKey:@"app"];
        [defaults synchronize];

        
        if (webtype==2) {
              if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
              {
                  _tabbarcntrl=[[UITabBarController alloc]init];
                  _tabbarcntrl.tabBar.tintColor=[[UIColor alloc]initWithRed:0.22 green:0.33 blue:0.52 alpha:1];
                  
                  BasicdetailsViewController *viewController2 = [[BasicdetailsViewController alloc] initWithNibName:@"BasicdetailsViewController" bundle:nil];
                  viewController2.Applicantid=Applicantid;
                  UINavigationController *basicnav=[[UINavigationController alloc]initWithRootViewController:viewController2];
                  
                  EducationViewController *viewController3 = [[EducationViewController alloc] initWithNibName:@"EducationViewController" bundle:nil];
                    viewController3.Applicantid=Applicantid;
                  UINavigationController *edunav=[[UINavigationController alloc]initWithRootViewController:viewController3];
                  JobsiteViewController *viewController1 = [[JobsiteViewController alloc] initWithNibName:@"JobsiteViewController" bundle:nil];
                    viewController1.Applicantid=Applicantid;
                  UINavigationController *jobnav=[[UINavigationController alloc]initWithRootViewController:viewController1];
                  NewMedicalViewController *viewController4 = [[NewMedicalViewController alloc] initWithNibName:@"NewMedicalViewController" bundle:nil];
                    viewController4.Applicantid=Applicantid;
                  UINavigationController *mednav=[[UINavigationController alloc]initWithRootViewController:viewController4];
                  EmployeeViewController*viewcontroller5=[[EmployeeViewController alloc]initWithNibName:@"EmployeeViewController" bundle:nil];
                    viewcontroller5.Applicantid=Applicantid;
                  UINavigationController *empnav=[[UINavigationController alloc]initWithRootViewController:viewcontroller5];
                  CourseDrugViewController*viewcontroller6=[[CourseDrugViewController alloc]initWithNibName:@"CourseDrugViewController" bundle:nil];
                    viewcontroller6.Applicantid=Applicantid;
                  UINavigationController *coursenav=[[UINavigationController alloc]initWithRootViewController:viewcontroller6];
                  RaceViewController*viewcontroller7=[[RaceViewController alloc]initWithNibName:@"RaceViewController" bundle:nil];
                    viewcontroller7.applicantId=Applicantid;
                  UINavigationController *racenav=[[UINavigationController alloc]initWithRootViewController:viewcontroller7];
                  DocumentsViewController*viewcontroller8=[[DocumentsViewController alloc]initWithNibName:@"DocumentsViewController" bundle:nil];
                 
                  UINavigationController *docnav=[[UINavigationController alloc]initWithRootViewController:viewcontroller8];
                  viewcontroller8.applicantid=Applicantid;
                  NSArray *controllers = [NSArray arrayWithObjects:jobnav,basicnav,edunav,mednav,empnav,coursenav,racenav,docnav,nil];
                  self.tabbarcntrl.viewControllers = controllers;
                  
                  
                  [self.navigationController pushViewController:_tabbarcntrl animated:YES];
                  

              }
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                _tabbarcntrl=[[UITabBarController alloc]init];
                _tabbarcntrl.tabBar.tintColor=[[UIColor alloc]initWithRed:0.22 green:0.33 blue:0.52 alpha:1];
                BasicdetailsViewController *viewController3 = [[BasicdetailsViewController alloc] initWithNibName:@"BasicdetailsViewController_iphone" bundle:nil];
                  viewController3.Applicantid=Applicantid;
                  UINavigationController *basicnav=[[UINavigationController alloc]initWithRootViewController:viewController3];
                UploadImageViewController*viewController2=[[UploadImageViewController alloc]initWithNibName:@"UploadImageViewController" bundle:nil];
                  viewController2.Applicantid=Applicantid;
                UINavigationController *uploadnav=[[UINavigationController alloc]initWithRootViewController:viewController2];
                EducationViewController *viewController4 = [[EducationViewController alloc] initWithNibName:@"EducationViewController_iphone" bundle:nil];
                  viewController4.Applicantid=Applicantid;
                UINavigationController *edunav=[[UINavigationController alloc]initWithRootViewController:viewController4];
                JobsiteViewController *viewController1 = [[JobsiteViewController alloc] initWithNibName:@"JobsiteViewController_iphone" bundle:nil];
                  viewController1.Applicantid=Applicantid;
                UINavigationController *jobnav=[[UINavigationController alloc]initWithRootViewController:viewController1];
                NewMedicalViewController *viewController5 = [[ NewMedicalViewController alloc] initWithNibName:@"NewMedicalViewController_iphone" bundle:nil];
                  viewController5.Applicantid=Applicantid;
                UINavigationController *mednav=[[UINavigationController alloc]initWithRootViewController:viewController5];
                EmployeeViewController*viewcontroller6=[[EmployeeViewController alloc]initWithNibName:@"EmployeeViewController_iphone" bundle:nil];
                  viewcontroller6.Applicantid=Applicantid;
                UINavigationController *empnav=[[UINavigationController alloc]initWithRootViewController:viewcontroller6];
                CourseDrugViewController*viewcontroller7=[[CourseDrugViewController alloc]initWithNibName:@"CourseDrugViewController_iphone" bundle:nil];
                  viewcontroller7.Applicantid=Applicantid;
                UINavigationController *coursenav=[[UINavigationController alloc]initWithRootViewController:viewcontroller7];
                RaceViewController*viewcontroller8=[[RaceViewController alloc]initWithNibName:@"RaceViewController_iphone" bundle:nil];
                  viewcontroller8.applicantId=Applicantid;
                UINavigationController *racenav=[[UINavigationController alloc]initWithRootViewController:viewcontroller8];
                ShowDocViewController *viewcontroller9=[[ShowDocViewController alloc]initWithNibName:@"ShowDocViewController" bundle:nil];
                UINavigationController *docnav=[[UINavigationController alloc]initWithRootViewController:viewcontroller9];
               
                NSArray *controllers = [NSArray arrayWithObjects:jobnav,uploadnav,basicnav,edunav,mednav,empnav,racenav,docnav,nil];
                self.tabbarcntrl.viewControllers = controllers;
                
                
                [self.navigationController pushViewController:_tabbarcntrl animated:YES];
                
            }
            
        }
        
        else{
            if (Applicantid!=0){
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Already Registered" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert show];
            
          
                
                
            
        }
        }
        

    
       
            
             
         
        _soapResults = nil;
    }

if([elementName isEqualToString:@"result"])
{
    recordResults = FALSE;
    
    [self GetApplicantId];
    
   
    
 _soapResults = nil;
}
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:@"Already Registered"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];

        
    }
    
      }

-(IBAction)continue_iphone:(id)sender
{
    
    
    ssnstring=_Ssntxtfld_iphone.text;
    
    
    //checking a particular charector
    // NSString *connectstring;
    if([_Ssntxtfld.text isEqualToString:@""])
    {
        _connectstring=_Ssntxtfld_iphone.text;
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Please Enter Your SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
        
        [alert show];
        
    }
    NSLog (@"ssnstring length %d", [ssnstring length]);
    
    
    if ([ssnstring length]<9) {
        _connectstring=_Ssntxtfld_iphone.text;

        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
        
        [alert show];
        
        
        
    }
    else         {
        ssnstring=_Ssntxtfld_iphone.text;
        
        
        //checking a particular charector
        // NSString *connectstring;
        NSString*new=[ssnstring substringWithRange:NSMakeRange(3, 1)];
        NSString*new1=[ssnstring substringWithRange:NSMakeRange(6, 1)];
        
        
        
        NSCharacterSet *notAllowedChars = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
        NSString *resultString = [[ssnstring componentsSeparatedByCharactersInSet:notAllowedChars] componentsJoinedByString:@""];
        NSLog (@"Result: %@", resultString);
        
        if ([resultString length]==11) {
            
            
            
            
            
            
            if ([new  isEqualToString:@"-"]&&[new1  isEqualToString:@"-"]) {
                _connectstring=resultString;
            }
            
            
        }
        
        
        if ([resultString length]==9) {
            
            
            
            
            NSString *subString = [resultString substringWithRange:NSMakeRange(0,3)];
            NSLog(@"%@",subString);
            NSString *substring2=[resultString  substringWithRange:NSMakeRange(3,2)];
            NSLog(@"%@",substring2);
            NSString *substring3=[resultString  substringWithRange:NSMakeRange(5,4)];
            NSLog(@"%@",substring3);
            _connectstring=[NSString stringWithFormat:@"%@-%@-%@",subString,substring2,substring3];
            NSLog(@"%@",_connectstring);
            _Ssntxtfld_iphone.text=_connectstring;
            
        }
        
        
        
        
        
        else   if ([resultString length]==10)  {
            
            _connectstring=_Ssntxtfld_iphone.text;

            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
            
            [alert show];
            
        }
    }
    
    

    Validation *val=[[Validation alloc]init];
    int value1=[val isBlank:_Ssntxtfld_iphone.text];
    int value2=[val isBlank:_passwdtxtfld_iphone.text];
    int value3=[val isBlank:_confirmpasswrd_iphone.text];
    if (value1==0||value2==0||value3==0) {
        if(value1==0)
        {
            UIAlertView *alert1=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter Your Social Security Number" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert1 show];
        }
        
        
        else if(value2==0)
        {
            UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Enter your Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert2 show];
            
        }
        else if(value3==0)
        {
            UIAlertView *alert2=[[UIAlertView alloc]initWithTitle:@"Alert" message:@"Please Confirm your Password" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alert2 show];
            
        }
        
    }
    

   else if ([_passwdtxtfld_iphone.text isEqualToString:_confirmpasswrd_iphone.text]) {
        [self GetApplicantId2];
        
        
    }
    else{
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Password does not match" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    

}
-(IBAction)textfldshouldreturn:(id)sender
{
    [sender resignFirstResponder];
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if(textField==_passwdtxtfld)
    {
    NSUInteger newLength = [_passwdtxtfld.text length] + [string length] - range.length;
    return (newLength > 20) ? NO : YES;
    }
    if(textField==_confirmpasswrd)
    {
        NSUInteger newLength = [_confirmpasswrd.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_passwdtxtfld_iphone)
    {
        NSUInteger newLength = [_passwdtxtfld_iphone.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }
    if(textField==_confirmpasswrd_iphone)
    {
        NSUInteger newLength = [_confirmpasswrd_iphone.text length] + [string length] - range.length;
        return (newLength > 20) ? NO : YES;
    }

}
#pragma mark -Sqlite Database
-(void)createandcheckdatabase{
    _dirPaths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    _docsDir=[_dirPaths objectAtIndex:0];
    /* Build the path to the database file*/
    
    _databasePath = [[NSString alloc] initWithString: [_docsDir stringByAppendingPathComponent: @"EmployeeHrList.db"]];
    //NSLog(@"Path %@",_databasePath);
    
    NSFileManager *filemgr = [NSFileManager defaultManager];
    if ([filemgr fileExistsAtPath: _databasePath ] == NO)
    {
        const char *dbpath = [_databasePath UTF8String];
        if (sqlite3_open(dbpath, &_newEmplyhrListDB) == SQLITE_OK)
        {
            char *errMsg;
            const char *sql_stmt = "CREATE TABLE IF NOT EXISTS UserList (ID INTEGER PRIMARY KEY AUTOINCREMENT, SSN TEXT, Password TEXT)";
            
            
            if (sqlite3_exec(_newEmplyhrListDB, sql_stmt, NULL, NULL, &errMsg)
                != SQLITE_OK)
            {
                
                NSLog(@"Failed to create table");
                NSLog( @"Error while inserting '%s'", sqlite3_errmsg(_newEmplyhrListDB));
            }
            sqlite3_close(_newEmplyhrListDB);
            
        }
        
        else {
            NSLog( @"Failed to open/create database");
            
        }
        
    }

    
}

-(void)savedatatoDB{
    
    sqlite3_stmt *statement;
    const char* dbpath=[_databasePath UTF8String];
    
    if (sqlite3_open(dbpath, &_newEmplyhrListDB)==SQLITE_OK) {
        NSString*INSERTSql=[NSString stringWithFormat:@"INSERT  INTO UserList(SSN,Password) VALUES (\"%@\",\"%@\")",_Ssntxtfld.text,_confirmpasswrd];
        const char *insertstmt=[INSERTSql UTF8String];
        sqlite3_prepare_v2(_newEmplyhrListDB, insertstmt, -1, &statement, NULL);
        if ((sqlite3_step(statement))==SQLITE_DONE ) {
            
            NSLog( @"UserDetail's added");

        
        }
        
        else{
            
               NSLog( @"Failed to add userdetails");
        }
    
    
    sqlite3_finalize(statement);
    sqlite3_close(_newEmplyhrListDB);
    }
    
}

-(void)FetchuserdetailsfromDB{
    
    const char *dbpath=[_databasePath UTF8String];
    sqlite3_stmt*statement;
    if (sqlite3_open(dbpath, &_newEmplyhrListDB)) {
        NSString*query=[NSString stringWithFormat:@"SELECT * FROM UserList"];
        const char *query_stmt=[query UTF8String];
    }
}

@end
