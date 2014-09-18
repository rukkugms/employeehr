//
//  SecondRaceViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/11/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "SecondRaceViewController.h"

@interface SecondRaceViewController ()

@end

@implementation SecondRaceViewController

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
    _scrollview.frame=CGRectMake(0, 0, 320, 548);
     [ _scrollview setContentSize:CGSizeMake(320,850)];
    
    NSLog(@"race %d",_race1.isConvicted);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
  if (_ethicity1.IsProtectedVeteran==1) {
        _campaignsgmt.selectedSegmentIndex=0;
    }
    else if (_ethicity1.IsProtectedVeteran==0){
          _campaignsgmt.selectedSegmentIndex=1;
    }
    
    
    if (_ethicity1.IsDisable==1) {
        _Affirmatvesgmt.selectedSegmentIndex=0;
    }
    else if (_ethicity1.IsDisable==0){
        _Affirmatvesgmt.selectedSegmentIndex=1;
    }
    
    if (_ethicity1.IsVietnamEra==1) {
        _activedutysgmnt.selectedSegmentIndex=0;
    }
    else  if (_ethicity1.IsVietnamEra==0){
         _activedutysgmnt.selectedSegmentIndex=1;
    }
    
    if (_ethicity1.IsActiveReservist==1) {
        _reservistsgmnt.selectedSegmentIndex=0;
    }
    else   if (_ethicity1.IsActiveReservist==0) {
        _reservistsgmnt.selectedSegmentIndex=1;
    }
    
    if (_ethicity1.IsDisbledVeteran==1) {
        _departmentsgmnt.selectedSegmentIndex=0;
    }
    else if (_ethicity1.IsDisbledVeteran==0){
        _departmentsgmnt.selectedSegmentIndex=1;
    }
    
    if (_ethicity1.IsSeperatedVeteran==1) {
        _seperatedsegmnt.selectedSegmentIndex=0;
    }
    else  if (_ethicity1.IsSeperatedVeteran==0){
        _seperatedsegmnt.selectedSegmentIndex=1;
    }

}
#pragma webservice
-(void)UpdateApplicantInformations
{
    
    recordResults = FALSE;
    
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateApplicantInformations xmlns=\"http://testUSA.kontract360.com/\">\n"
                   "<ApplicantId>%d</ApplicantId>\n"
                   "<IsConvict>%d</IsConvict>\n"
                   "<ConvictExplanation>%@</ConvictExplanation>\n"
                   "<TWICNumber>%@</TWICNumber>\n"
                   "<AgeLimit>%d</AgeLimit>\n"
                   "<LegelRights>%d</LegelRights>\n"
                   "<WorkedOverTime>%d</WorkedOverTime>\n"
                   "<WorkedEarlier>%d</WorkedEarlier>\n"
                   "<WorkedPeriod>%@</WorkedPeriod>\n"
                   "<WorkOutofTown>%d</WorkOutofTown>\n"
                   "<Referred>%@</Referred>\n"
                   "<ReferredAgency>%@</ReferredAgency>\n"
                   "<IsProtectedVeteran>%d</IsProtectedVeteran>\n"
                   "<IsDisable>%d</IsDisable>\n"
                   "<IsVietnamEra>%d</IsVietnamEra>\n"
                   "<IsActiveReservist>%d</IsActiveReservist>\n"
                   "<IsDisabledVeteran>%d</IsDisabledVeteran>\n"
                   "<IsSeperatedVeteran>%d</IsSeperatedVeteran>\n"
                   "</UpdateApplicantInformations>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantId,_race1.isConvicted,_race1.convictexplanation,_race1.twiccardno,_race1.agelimit,_race1.legalrights,_race1.WorkOverTime,_race1.WorkedEarlier,_race1.WorkedPeriod,_race1.WorkedOutofTown,_race1.reffered,_race1.reffereagency,_IsProtectedVeteranValue,_IsDisablevalue,_IsVietnamEravalue,_IsActiveReservistvalue,_IsDisabledVeteranvalue,_IsSeperatedVeteranvalue];
    NSLog(@"soapmsg%@",soapMessage);
        
   NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
     //  NSURL *url = [NSURL URLWithString:@"http://testusa.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue:@"http://testUSA.kontract360.com/UpdateApplicantInformations" forHTTPHeaderField:@"Soapaction"];
    
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



- (IBAction)submitbtn:(id)sender {
    
       if(_campaignsgmt.selectedSegmentIndex==0)
    {_IsProtectedVeteranValue=1;
       
    }
    else if(_campaignsgmt.selectedSegmentIndex==1)
    {_IsProtectedVeteranValue=0;
       
    }
    
    if(_Affirmatvesgmt.selectedSegmentIndex==0)
    { _IsDisablevalue=1;
           }
    else if(_Affirmatvesgmt.selectedSegmentIndex==1)
    { _IsDisablevalue=0;
       
    }
    if(_activedutysgmnt.selectedSegmentIndex==0)
    { _IsVietnamEravalue=1;

            }
    else if(_activedutysgmnt.selectedSegmentIndex==1)
    { _IsVietnamEravalue=0;
       
    }
    if(_reservistsgmnt.selectedSegmentIndex==0)
    {
        _IsActiveReservistvalue=1;
    }
    else if(_reservistsgmnt.selectedSegmentIndex==1)
    {
         _IsActiveReservistvalue=0;
    }
    if(_departmentsgmnt.selectedSegmentIndex==0)
    {
        _IsDisabledVeteranvalue=1;
    }
    else if(_departmentsgmnt.selectedSegmentIndex==1)
    {
         _IsDisabledVeteranvalue=0;
    }

    
    if(_seperatedsegmnt.selectedSegmentIndex==0)
    {
        _IsSeperatedVeteranvalue=1;
    }
    else if(_seperatedsegmnt.selectedSegmentIndex==1)
    {
        _IsSeperatedVeteranvalue=0;
    }
    

    
    
    [self UpdateApplicantInformations];
    
}
@end
