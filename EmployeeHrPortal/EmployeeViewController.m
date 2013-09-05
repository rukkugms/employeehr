//
//  EmployeeViewController.m
//  EmployeePortal
//
//  Created by GMSIndia1 on 7/25/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
         self.title=NSLocalizedString(@"Previous Employer", @"Previous Employer");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _scroll.frame=CGRectMake(0, 0,1024, 768);
    [ _scroll setContentSize:CGSizeMake(1024,850)];
    _prevousEmpTable.layer.borderWidth = 2.0;
    _prevousEmpTable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    [self selectApplicantPreviousEmployer];
    // Do any additional setup after loading the view from its nib.
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    UIBarButtonItem *homebutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"rounded"] style:UIBarButtonItemStylePlain target:self action:@selector(homeAction)];
    [self.navigationItem setRightBarButtonItem:homebutton animated:YES];
      self.navigationItem.hidesBackButton=YES;    
}
-(void)homeAction{
    [self updateViewConstraints];
   // [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"home" object:self userInfo:nil];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)SavePreviousemployee:(id)sender
{
    [self insertPreviousEmployer];
    
}

- (IBAction)selectdate:(id)sender {
    [self createCalenderPopover];
}
-(IBAction)deletepreviousemp:(id)sender
{
    if (self.editing) {
        [super setEditing:NO animated:NO];
        [_prevousEmpTable setEditing:NO animated:NO];
        [_prevousEmpTable reloadData];
        
        
        [_deletebtn setTitle:@"Delete" forState:UIControlStateNormal];
        
        
        
    }
    
    else{
        [super setEditing:YES animated:YES];
        [_prevousEmpTable setEditing:YES animated:YES];
        [_prevousEmpTable reloadData];
        
        [_deletebtn setTitle:@"Done" forState:UIControlStateNormal];        
        
    }

}
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
    calendar.maximumDate =[self.dateFormatter dateFromString:@"1/07/2014"];
    calendar.shouldFillCalendar = YES;
    calendar.adaptHeightToNumberOfWeeksInMonth = NO;
    
    calendar.frame = CGRectMake(10, 10, 300, 320);
    [popoverView addSubview:calendar];
    
    //    self.dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(calendar.frame) + 4, self.view.bounds.size.width, 24)];
    //    [self.view addSubview:self.dateLabel];
    
    //  self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(localeDidChange) name:NSCurrentLocaleDidChangeNotification object:nil];
    
    
    //create a popover controller
    self.popOverController1 = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    [self.popOverController1 presentPopoverFromRect:_datebtn.frame
                                             inView:self.view
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];
    
}

- (void)localeDidChange {
    [self.calendar setLocale:[NSLocale currentLocale]];
}



#pragma mark - CKCalendarDelegate

- (void)calendar:(CKCalendarView *)calendar didSelectDate:(NSDate *)date {
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:@"MM-dd-YYYY"];
    
    NSString *dateString = [dateFormat stringFromDate:date];
    [_datebtn setTitle:dateString forState:UIControlStateNormal];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView==_prevousEmpTable) {
        return [_previousemployeeArray count];
        
        
    }
       
    return YES;
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       
            [[NSBundle mainBundle]loadNibNamed:@"customprevious" owner:self options:nil];
            cell=_previouscell;
        
               
        
    }
    
       
        _previous=(previousemp *)[_previousemployeeArray objectAtIndex:indexPath.row];
        _companynamelabel=(UILabel*)[cell viewWithTag:1];
        _companynamelabel.text=_previous.previouscompany;
        _datelabel=(UILabel*)[cell viewWithTag:2];
    _datelabel.text=_previous.dateofemployee;
        _rateofpaylabel=(UILabel*)[cell viewWithTag:3];
        _rateofpaylabel.text=_previous.previousrateofpay;
        _positionlabel=(UILabel*)[cell viewWithTag:4];
        _positionlabel.text=_previous.previousposition;
        _reasonforleavinglabel=(UILabel*)[cell viewWithTag:5];
        _reasonforleavinglabel.text=_previous.reasonforleaving;
        
        
        
        
      return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    identifr=indexPath.row;
    if (editingStyle==UITableViewCellEditingStyleDelete) {
        [self DeleteApplicantPreviousEmployer];
              
        [_previousemployeeArray removeObjectAtIndex:indexPath.row];
        
        
        
    }
}




#pragma mark - webservice

-(void)insertPreviousEmployer
{   webtype=1;
    NSLog(@"date%@",_datebtn.titleLabel.text);
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
   [dateFormat setDateFormat: @"MM-dd-yyyy"];
    
    NSDate *dateString = [dateFormat dateFromString:_datebtn.titleLabel.text];
    NSDateFormatter *dateFormat1 = [[NSDateFormatter alloc]init];
    [dateFormat1 setDateFormat:@"yyyy-MM-dd"];
    NSString* sqldate=[dateFormat1 stringFromDate:dateString];
    NSLog(@"s%@",sqldate);
    NSString *compnyname=_previouscompanytxt.text;
    //NSString *rateofpay=_rateofpaytxt.text;
    
    NSString *prevoiusposition=_positionheldtxt.text;
    NSString *reasonforleaving=_reasonforleavingtxt.text;
    NSInteger createdUser=0;
    NSInteger modifieduser=0;
    NSString *createdDate=@"2013-01-01";
    NSString *modifieddate=@"2013-01-01";

    _previousid=0;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertApplicantPreviousEmployer xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<ApplicantId>%d</ApplicantId>\n"
                   "<PreviousId>%d</PreviousId>\n"
                   "<PreviousCompany>%@</PreviousCompany>\n"
                   "<EmploymentDate>%@</EmploymentDate>\n"
                   "<PreviousRateofPay>%f</PreviousRateofPay>\n"
                   "<PreviousPosition>%@</PreviousPosition>\n"
                   "<LeavingReason>%@</LeavingReason>\n"
                   "<CreatedDate>%@</CreatedDate>\n"
                   "<CreatedUser>%d</CreatedUser>\n"
                   "<ModifiedDate>%@</ModifiedDate>\n"
                   "<ModifiedUser>%d</ModifiedUser>\n"
                   "</InsertApplicantPreviousEmployer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid,_previousid,compnyname,sqldate,[_rateofpaytxt.text floatValue],prevoiusposition,reasonforleaving,createdDate,createdUser,modifieddate,modifieduser];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/InsertApplicantPreviousEmployer" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)selectApplicantPreviousEmployer
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<SelectApplicantPreviousEmployer xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</SelectApplicantPreviousEmployer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/SelectApplicantPreviousEmployer" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)DeleteApplicantPreviousEmployer
{
    _previous=(previousemp *)[_previousemployeeArray objectAtIndex:identifr];
    NSInteger previosid=_previous.previousid;
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<DeleteApplicantPreviousEmployer xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<PreviousId>%d</PreviousId>\n"
                   "<AppId>%d</AppId>\n"
                   "</DeleteApplicantPreviousEmployer>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",previosid,_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/DeleteApplicantPreviousEmployer" forHTTPHeaderField:@"Soapaction"];
    
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
    [_prevousEmpTable reloadData];
    if (webtype==1) {
        [self selectApplicantPreviousEmployer];
        webtype=0;
    }

}


#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"SelectApplicantPreviousEmployerResult"])
    {
        _previousemployeeArray=[[NSMutableArray alloc]init];
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
    if([elementName isEqualToString:@"PreviousId"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PreviousCompany"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"DateofEmployment"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"PreviousRateofPay"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }


    if([elementName isEqualToString:@"PreviousPosition"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"LeavingReason"])
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
    if([elementName isEqualToString:@"ApplicantId"])
    {
        _previous=[[previousemp alloc]init];
        recordResults = FALSE;
        _previous.applicantid=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PreviousId"])
    {
            recordResults = FALSE;
        _previous.previousid=[_soapResults integerValue];
        _soapResults = nil;
    }
    
    if([elementName isEqualToString:@"PreviousCompany"])
    {
        recordResults = FALSE;
        _previous.previouscompany=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"DateofEmployment"])
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
        _previous.dateofemployee=myFormattedDate;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PreviousRateofPay"])
    {
        recordResults = FALSE;
        _previous.previousrateofpay=_soapResults;
        _soapResults = nil;
    }
    if([elementName isEqualToString:@"PreviousPosition"])
    {
        recordResults = FALSE;
        _previous.previousposition=_soapResults;
        _soapResults = nil;
    }

    if([elementName isEqualToString:@"LeavingReason"])
    {
        recordResults = FALSE;
        _previous.reasonforleaving=_soapResults;
        [_previousemployeeArray addObject:_previous];
        _soapResults = nil;
    }



    
}
-(IBAction)continueaction:(id)sender
{
    
//    if (!self.drugVCtrl) {
//        _drugVCtrl=[[DrugViewController alloc]initWithNibName:@"DrugViewController" bundle:nil];
//    }
//    _drugVCtrl.applicantId=_Applicantid;
//     _drugVCtrl.jobsiteid=_jobsiteid;
//    _drugVCtrl.craftid=_craftid;
//    [self.navigationController pushViewController:_drugVCtrl animated:YES];

    if (!self.coursedrugVCtrl) {
        _coursedrugVCtrl=[[CourseDrugViewController alloc]initWithNibName:@"CourseDrugViewController" bundle:nil];
    }
   _coursedrugVCtrl.Applicantid=_Applicantid;
 _coursedrugVCtrl.jobsiteid=_jobsiteid;
    _coursedrugVCtrl.craftid=_craftid;
    [self.navigationController pushViewController:_coursedrugVCtrl animated:YES];

    
    
}
@end