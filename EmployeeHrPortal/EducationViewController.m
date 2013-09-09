//
//  EducationViewController.m
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/9/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "EducationViewController.h"

@interface EducationViewController ()

@end

@implementation EducationViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.title=NSLocalizedString(@"Education Details", @"Education Details");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scroll.frame=CGRectMake(0, 0,1024, 768);
    [ _scroll setContentSize:CGSizeMake(1024,850)];
    
    _scroll_iphone.frame=CGRectMake(0, 0, 320, 548);
     [_scroll_iphone setContentSize:CGSizeMake(320,600)];
    
    
    _educationtable.layer.borderWidth = 2.0;
    _educationtable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    _certificatetable.layer.borderWidth = 2.0;
    _certificatetable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    _edunamearray=[[NSMutableArray alloc]initWithObjects:@"High School",@"College",@"Other", nil];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    UIBarButtonItem *homebutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"rounded"] style:UIBarButtonItemStylePlain target:self action:@selector(homeAction)];
    [self.navigationItem setRightBarButtonItem:homebutton animated:YES];
      self.navigationItem.hidesBackButton=YES;    
}
//-(void)homeAction{
//   
// //   [self.navigationController popToViewController: animated:<#(BOOL)#>
//    
//}

-(void)homeAction
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"home" object:self userInfo:nil];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self SelectApplicantEducation];
    
    [self SelectApplicantCertificates];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Popover


-(void)CreatePopover
{
    
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 200, 250)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 200, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(200, 250);
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_edunamebtnlbl.frame
                                             inView:self.view1
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];
    
}

#pragma mark - Webservice
/*webservices*/

-(void)SelectApplicantCertificates{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectApplicantCertificates xmlns=\"http://webserv.kontract360.com/\">\n"
                     "<AppId>%d</AppId>\n"
                   "</SelectApplicantCertificates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/SelectApplicantCertificates" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)SelectApplicantEducation{
    
    recordResults = FALSE;
    NSString *soapMessage;
    
    
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectApplicantEducation xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</SelectApplicantEducation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/SelectApplicantEducation" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)InsertApplicantCertificates{
     webtype=2;
    recordResults = FALSE;
    NSString *soapMessage;
    NSInteger certificateid=0;
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat: @"MM/dd/yyyy"];
    
    NSDate *dateString = [dateFormat dateFromString:_certificatedatebtnlbl.titleLabel.text];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSString* sqldate=[dateFormat1 stringFromDate:dateString];

    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertApplicantCertificates xmlns=\"http://webserv.kontract360.com/\">\n"
                  
                   "<ApplicantId>%d</ApplicantId>\n"
                   "<CertificateId>%d</CertificateId>\n"
                   "<CertificateName>%@</CertificateName>\n"
                   "<CertificateDate>%@</CertificateDate>\n"
                   "</InsertApplicantCertificates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid,certificateid,_certifcatenametxt.text,sqldate];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/InsertApplicantCertificates" forHTTPHeaderField:@"Soapaction"];
    
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

-(void)InsertApplicantEducation{
    webtype=1;
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
                   "</soap:Envelope>\n",_Applicantid,eduid,_edunamebtnlbl.titleLabel.text,[_yearscompleted.text integerValue],_insitutionname.text,_citytxtfld.text,_statetxtfld.text];
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
-(void)DeleteApplicantEducation
{
    _Edumodel=(Educationdetails *)[_eduarray objectAtIndex:identifr];
    NSInteger eduwid=_Edumodel.eduid;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteApplicantEducation xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<EducationId>%d</EducationId>\n"
                   "<AppId>%d</AppId>\n"
                   "</DeleteApplicantEducation>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",eduwid,_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/DeleteApplicantEducation" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteApplicantCertificates
{
    certificateModel*certifictem=(certificateModel*)[_certifctearray objectAtIndex:identifr];
    NSInteger certid=certifictem.certificateid;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteApplicantCertificates xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<CertificateId>%d</CertificateId>\n"
                   "<AppId>%d</AppId>\n"
                   "</DeleteApplicantCertificates>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",certid,_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/DeleteApplicantCertificates" forHTTPHeaderField:@"Soapaction"];
    
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
    [_certificatetable reloadData];
    [_educationtable reloadData];
    if (webtype==2) {
        [self SelectApplicantCertificates];
        webtype=0;
    }
    if (webtype==1) {
        [self SelectApplicantEducation];
        webtype=0;
    }

    
}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    
    
    if([elementName isEqualToString:@"SelectApplicantCertificatesResult"])
    {
        _certifctearray=[[NSMutableArray alloc]init];
        
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"CertificateId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"ApplicantId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"CertificateName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"CertificateDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    
    if([elementName isEqualToString:@"SelectApplicantEducationResult"])
    {
        _eduarray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"EducationId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"EducationName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"YearsCompleted"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }

    if([elementName isEqualToString:@"InstituteName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InstituteCity"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"InstituteState"])
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
       
    
    
    
    if([elementName isEqualToString:@"CertificateId"])
    {
        _cerifcteml=[[certificateModel alloc]init];
        recordResults = FALSE;
        _cerifcteml.certificateid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"ApplicantId"])
    { recordResults = FALSE;
        _Applicantid=[_soapResults integerValue];
         _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"CertificateName"])
    {
        recordResults = FALSE;
        _cerifcteml.certificatename=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"CertificateDate"])
    {
        recordResults = FALSE;
        NSArray *dateArray=[[NSArray alloc]init];
        dateArray=[_soapResults componentsSeparatedByString:@"T"];
        NSString *date1 =[dateArray objectAtIndex:0];
        NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        [dateFormat setDateFormat:@"yyyy-MM-dd"];
        NSDate *dates = [dateFormat dateFromString:date1];
        [dateFormat setDateFormat:@"MM-dd-yyy"];
        NSString *myFormattedDate = [dateFormat stringFromDate:dates];
        _cerifcteml.date=myFormattedDate;
        [_certifctearray addObject:_cerifcteml];
      
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"EducationId"])
    {
        _Edumodel=[[Educationdetails alloc]init];
       recordResults = FALSE;
        _Edumodel.eduid=[_soapResults integerValue];
     _soapResults = nil;
    }
    if([elementName isEqualToString:@"EducationName"])
    {
        recordResults = FALSE;
        _Edumodel.educationname=_soapResults;
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"YearsCompleted"])
    {
        recordResults = FALSE;
        _Edumodel.yearscompleted=[_soapResults integerValue];
        _soapResults = nil;

    }
    
    if([elementName isEqualToString:@"InstituteName"])
    {
        recordResults = FALSE;
        _Edumodel.InstituteName=_soapResults;
        _soapResults = nil;

    }
    if([elementName isEqualToString:@"InstituteCity"])
    {
        recordResults = FALSE;
        _Edumodel.city=_soapResults;
        
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"InstituteState"])
    {
        recordResults = FALSE;
        _Edumodel.state=_soapResults;
        [_eduarray addObject:_Edumodel];
        _soapResults = nil;
    }
    


}
#pragma mark - Tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_certificatetable) {
        return [_certifctearray count];

        
    }
    if (tableView==_educationtable) {
        return [_eduarray count];
        
        
    }
    if (tableView==_popOverTableView) {
        return [_edunamearray count];
        
        
    }

    return YES;

    
    }
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
         if (tableView==_certificatetable) {
        [[NSBundle mainBundle]loadNibNamed:@"EducationCertificatecell" owner:self options:nil];
        cell=_certificatecell;
         }
        if (tableView==_educationtable) {
            [[NSBundle mainBundle]loadNibNamed:@"CellEducationtable" owner:self options:nil];
            cell=_educell;
        }

               
    }
    
      if (tableView==_popOverTableView) {
          cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
          cell.textLabel.font = [UIFont systemFontOfSize:12.0];

          cell.textLabel.text=[_edunamearray objectAtIndex:indexPath.row];
      }
     if (tableView==_educationtable) {
         _Edumodel=(Educationdetails *)[_eduarray objectAtIndex:indexPath.row];
         _edunamelbl=(UILabel*)[cell viewWithTag:1];
         _edunamelbl.text=_Edumodel.educationname;
         _yearslbl=(UILabel*)[cell viewWithTag:2];
         _yearslbl.text=[NSString stringWithFormat:@"%d",_Edumodel.yearscompleted];
         _institutelbl=(UILabel*)[cell viewWithTag:3];
         _institutelbl.text=_Edumodel.InstituteName;
         _citylbl=(UILabel*)[cell viewWithTag:4];
         _citylbl.text=_Edumodel.city;
         _statelbl=(UILabel*)[cell viewWithTag:5];
         _statelbl.text=_Edumodel.state;
         
         
         
         
     }
    
     if (tableView==_certificatetable) {
    certificateModel*certifictem=(certificateModel*)[_certifctearray objectAtIndex:indexPath.row];
    //cell.textLabel.text=[NSString stringWithFormat:@"%@                               %@",certifictem.certificatename,certifictem.date];
   
    _Cnamelbl=(UILabel*)[cell viewWithTag:1];
    _Cnamelbl.text=certifictem.certificatename;
    _cdatelbl=(UILabel*)[cell viewWithTag:2];
    _cdatelbl.text=certifictem.date;
    
     }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [_edunamebtnlbl setTitle:[_edunamearray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView==_educationtable)
    {
    identifr=indexPath.row;
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self DeleteApplicantEducation];
        [_eduarray removeObjectAtIndex:indexPath.row];
    }
    }
    if(tableView==_certificatetable)
    {
        identifr=indexPath.row;
        if (editingStyle==UITableViewCellEditingStyleDelete) {
            [self DeleteApplicantCertificates];
            [_certifctearray removeObjectAtIndex:indexPath.row];
        }

    }
    
}


#pragma mark - Action

- (IBAction)selecteducationbtn:(id)sender {
    [self CreatePopover];
}

- (IBAction)closebutn:(id)sender {
    _view1.hidden=YES;
}

- (IBAction)Addeduction:(id)sender {
    
    _view1.hidden=NO;
    }

- (IBAction)Addcertificate:(id)sender {
    _view2.hidden=NO;
}

- (IBAction)certificataeclsebtn:(id)sender {
     _view2.hidden=YES;
}

- (IBAction)datebtn:(id)sender {
     [self createCalenderPopover];
}

- (IBAction)savebtn:(id)sender {
    [self InsertApplicantCertificates];
}

- (IBAction)cancelbtn:(id)sender {
}

- (IBAction)edusavebtn:(id)sender {
    [self InsertApplicantEducation];
}

- (IBAction)educancelbtn:(id)sender {
    
       
    
}

- (IBAction)deleteedubtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_educationtable setEditing:NO animated:NO];
        [_educationtable reloadData];
        
        // [_delete_ipad setTitle:@"Done"];
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_educationtable setEditing:YES animated:YES];
        [_educationtable reloadData];
        // [_delete_ipad setTitle:@"Delete"];
        
        
        
        
    }
    

       
}

- (IBAction)certdeletebtn:(id)sender {
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_certificatetable setEditing:NO animated:NO];
        [_certificatetable reloadData];
        
        // [_delete_ipad setTitle:@"Done"];
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_certificatetable setEditing:YES animated:YES];
        [_certificatetable reloadData];
        // [_delete_ipad setTitle:@"Delete"];
        
        
        
        
    }
    

    
    
    
}
#pragma mark - Calendar
-(void)createCalenderPopover
{
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 315, 330)];
    
    popoverView.backgroundColor = [UIColor lightTextColor];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(315, 330);
    
    CKCalendarView *calendar = [[CKCalendarView alloc] initWithStartDay:startMonday];
    self.calendar = calendar;
    calendar.delegate = (id)self;
    
    
    NSDate *date = [NSDate date];
    
    // format it
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"dd/MM/YYYY"];
    
    // convert it to a string
    NSString *dateString = [dateFormat stringFromDate:date];
    //NSLog(@"datestring%@",dateString);
    
    self.dateFormatter = [[NSDateFormatter alloc] init];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    
    calendar.selectedDate = [self.dateFormatter dateFromString:dateString];
    
    calendar.minimumDate = [self.dateFormatter dateFromString:@"09/07/2011"];
    calendar.maximumDate =[self.dateFormatter dateFromString:@"1/07/2020"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    //    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
    //    [self.view addSubview:self.dateLabel];
    
    //  self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    [self.popOverController presentPopoverFromRect:_edunamebtnlbl.frame
                                             inView:self.view2
                           permittedArrowDirections:UIPopoverArrowDirectionLeft
                                           animated:YES];
    
}




- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM/dd/YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_certificatedatebtnlbl setTitle:dateString forState:UIControlStateNormal];
    
}
-(IBAction)continueAction:(id)sender
{
    
//    if (!self.newmedVCtrl) {
//        _newmedVCtrl=[[NewMedicalViewController alloc]initWithNibName:@"NewMedicalViewController" bundle:nil];
//    }
//    _newmedVCtrl.Applicantid=_Applicantid;
//    [self.navigationController pushViewController:_newmedVCtrl animated:YES];

    }

@end
