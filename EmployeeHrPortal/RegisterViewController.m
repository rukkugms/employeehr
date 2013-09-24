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
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    UIBarButtonItem *homebutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"rounded"] style:UIBarButtonItemStylePlain target:self action:@selector(homeAction)];
    [self.navigationItem setRightBarButtonItem:homebutton animated:YES];
      self.navigationItem.hidesBackButton=YES;    
}
-(void)homeAction{
    
    [self.navigationController popViewControllerAnimated:YES];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)continuebtn:(id)sender {
    
    if ([_passwdtxtfld.text isEqualToString:_confirmpasswrd.text]) {
        [self GetApplicantId2];

        
    }
    else{
        
        UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Password does not match" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    
    
      
    
 }

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        
        if (textField==_passwdtxtfld) {
            
            
            ssnstring=_Ssntxtfld.text;
            
            
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
                    _Ssntxtfld.text=_connectstring;
                    
                }
                
            }
            
            
            
            else{
                
                
                
                UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
                
                [alert show];
                
            }
            
        }
    }
    
    else if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone){
        
        ssnstring=_Ssntxtfld_iphone.text;
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
                _Ssntxtfld_iphone.text=_connectstring;
                
            }
            
        }
        else{
            
            
            
            UIAlertView*alert=[[UIAlertView alloc]initWithTitle:nil message:@"Invalid SSN" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil , nil];
            
            [alert show];
            
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
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
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
     
     
     // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
     NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
     
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
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
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
        
        
        // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
        NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
        
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
        Applicantid=[_soapResults integerValue];;
        
        if (webtype==2) {
              if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
              {
            if (!self.firstVCtrl) {
                _firstVCtrl=[[JobsiteViewController alloc]initWithNibName:@"JobsiteViewController" bundle:nil];
            }
            //_firstVCtrl.Applicantid=Applicantid;
            [self.navigationController pushViewController:_firstVCtrl animated:YES];
              }
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone)
            {
                if (!self.firstVCtrl) {
                    _firstVCtrl=[[JobsiteViewController alloc]initWithNibName:@"JobsiteViewController_iphone" bundle:nil];
                }
                //_firstVCtrl.Applicantid=Applicantid;
                [self.navigationController pushViewController:_firstVCtrl animated:YES];
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
    
    [self GetApplicantId];
    
   
    

}
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if ([alertView.message isEqualToString:@"Already Registered"]) {
        [self.navigationController popToRootViewControllerAnimated:YES];

        
    }
    
      }

-(IBAction)continue_iphone:(id)sender
{
    if ([_passwdtxtfld_iphone.text isEqualToString:_confirmpasswrd_iphone.text]) {
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

@end
