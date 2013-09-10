//
//  AddEducationViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/10/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "AddEducationViewController.h"

@interface AddEducationViewController ()

@end

@implementation AddEducationViewController

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
    // Do any additional setup after loading the view from its nib.
     _edunamearray=[[NSMutableArray alloc]initWithObjects:@"High School",@"College",@"Other", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Webservice
/*webservices*/
-(void)InsertApplicantEducation{
   // webtype=1;
    NSInteger eduid=0;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertApplicantEducation xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<ApplicantId>%d</ApplicantId>\n"
                   "<EduId>%d</EduId>\n"
                   "<EduName>%@</EduName>\n"
                   "<YersCompleted>%d</YersCompleted>\n"
                   "<InstituteName>%@</InstituteName>\n"
                   "<InstituteCity>%@</InstituteCity>\n"
                   "<InstituteState>%@</InstituteState>\n"
                   "</InsertApplicantEducation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid,eduid,_edunamelbl.titleLabel.text,[_yrstxtfld.text integerValue],_institutenametxtfld.text,_citytxtfld.text,_statetxtfld.text];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/InsertApplicantEducation" forHTTPHeaderField:@"Soapaction"];
    
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

#pragma -Actions
- (IBAction)savebtn:(id)sender {
    [self InsertApplicantEducation];
    
}

- (IBAction)cancelbtn:(id)sender {
    
    
}

- (IBAction)eduname:(id)sender {
    _edupicker.hidden=NO;
    [_edupicker reloadAllComponents];
}

-(IBAction)returnkey:(id)sender{
    [sender resignFirstResponder];
}

#pragma mark - Picker delegate
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView==_edupicker) {
        return [_edunamearray count];
    }
    return YES;
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    
    
    if (pickerView==_edupicker) {
        return [_edunamearray objectAtIndex:row];
    }
}

#pragma mark -
#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if (pickerView==_edupicker) {
        [_edunamelbl setTitle:[_edunamearray objectAtIndex:row] forState:UIControlStateNormal];
        _edupicker.hidden=YES;
    }
    
    
}


@end
