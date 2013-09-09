//
//  CourseDrugViewController.m
//  EmployeePortal
//
//  Created by GMSIndia1 on 8/19/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "CourseDrugViewController.h"

@interface CourseDrugViewController ()

@end

@implementation CourseDrugViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Requirement Details", @"Requirement Details");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _detailstable.layer.borderWidth = 2.0;
     _detailstable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    _monthArray=[[NSMutableArray alloc]initWithObjects:@"JAN",@"FEB",@"MAR",@"APR",@"MAY",@"JUN",@"JUL",@"AUG",@"SEP",@"OCT",@"NOV",@"DEC",nil];
    _monthdictArray=[[NSMutableArray alloc]initWithObjects:@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"10",@"11",@"12", nil];
    _monthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthdictArray forKeys:_monthArray];
    _remonthDictionary=[[NSMutableDictionary alloc]initWithObjects:_monthArray forKeys:_monthdictArray];
    _yearArray=[[NSMutableArray alloc]initWithObjects:@"2013",@"2014",@"2015",@"2016",@"2017",@"2018",@"2019",@"2020",@"2021",@"2022",@"2023", nil];

    [self InsertApplicantRequirements];
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    UIBarButtonItem *homebutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"rounded"] style:UIBarButtonItemStylePlain target:self action:@selector(homeAction)];
    [self.navigationItem setRightBarButtonItem:homebutton animated:YES];
      self.navigationItem.hidesBackButton=YES;    
}
-(void)homeAction{
    [self UpdateApplicantRequirements];
   // [self.navigationController popViewControllerAnimated:YES];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"home" object:self userInfo:nil];
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - tableview

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (tableView==_popOverTableView) {
        
        switch (Poptype) {
            case 1:
                return [_monthArray count];
                break;
            case 2:
                return [_yearArray count];
                break;
        }
    }
    if(tableView==_detailstable||tableView==_reqtable_iphone)
    {
        return [_requirementArray count];
        
    }
  
    return YES;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if(tableView==_detailstable)
        {
            
            
            [[NSBundle mainBundle]loadNibNamed:@"CourseDrugCellView" owner:self options:nil];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell=_detailcell;
        }
        if(tableView==_reqtable_iphone)
        {
            
            
            [[NSBundle mainBundle]loadNibNamed:@"CourseDrugCell_iphone" owner:self options:nil];
            cell.accessoryType = UITableViewCellAccessoryNone;
            cell=_reqcell_iphone;
        }

        
        
    }
    if (tableView==_popOverTableView) {
        cell.textLabel.font = [UIFont fontWithName:@"Helvetica Neue Light" size:12];
        cell.textLabel.font = [UIFont systemFontOfSize:12.0];
        
        switch (Poptype) {
            case 1:
                cell.textLabel.text=[_monthArray objectAtIndex:indexPath.row];
                break;
            case 2:
                cell.textLabel.text=[_yearArray objectAtIndex:indexPath.row];
                break;
        }
    }
    if(tableView==_detailstable)
        
        
    {
        Coursemdl*coursemdl1=(Coursemdl *)[_requirementArray objectAtIndex:indexPath.row];
        _requirmentlbl=(UILabel *)[cell viewWithTag:1];
        _requirmentlbl.text=coursemdl1.itemname;
        //NSLog(@"lbl%@",)
        button=(UIButton*)[cell viewWithTag:2];
        [button setTitle:coursemdl1.month forState:UIControlStateNormal];
        yearbutton=(UIButton *)[cell viewWithTag:3];
        
        [yearbutton setTitle:coursemdl1.year forState:UIControlStateNormal];
        _codelbl=(UILabel *)[cell viewWithTag:4];
        _codelbl.text=coursemdl1.Code;
        
        if (coursemdl1.course_status==1) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }else if (coursemdl1.course_status==0){
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
        
        if ([_selectedcellstring isEqualToString:@"selected"]) {
            
            Coursemdl*coursemdl3=(Coursemdl *)[_requirementArray objectAtIndex:indexPath.row];
            
            if(indexPath.row == selectedcell)
            {
                
                if(cell.accessoryType==UITableViewCellAccessoryNone)
                {
                    
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    coursemdl3.course_status=1;
                    //cell.selected = NO;
                    
                    
                }
                else if(cell.accessoryType==UITableViewCellAccessoryCheckmark)
                {
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    coursemdl3.course_status=0;
                    //cell.selected=NO;
                    
                }
                
                
            }
            
        }
        
    }
    if(tableView==_reqtable_iphone)
    {
        Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:indexPath.row];
        _reqlabel_iphone=(UILabel *)[cell viewWithTag:1];
        _reqlabel_iphone.text=coursemdl2.itemname;
        //NSLog(@"lbl%@",)
        monthbtn_iphone=(UIButton*)[cell viewWithTag:2];
        [monthbtn_iphone setTitle:coursemdl2.month forState:UIControlStateNormal];
        yearbtn_iphone=(UIButton *)[cell viewWithTag:3];
        
        [yearbtn_iphone setTitle:coursemdl2.year forState:UIControlStateNormal];
//        _codelbl=(UILabel *)[cell viewWithTag:4];
//        _codelbl.text=coursemdl2.Code;
        
        if (coursemdl2.course_status==1) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            
        }else if (coursemdl2.course_status==0){
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        

        if ([_selectedcellstring isEqualToString:@"selected"]) {
            
            Coursemdl*coursemdl3=(Coursemdl *)[_requirementArray objectAtIndex:indexPath.row];
            
            if(indexPath.row == selectedcell)
            {
                
                if(cell.accessoryType==UITableViewCellAccessoryNone)
                {
                    
                    cell.accessoryType = UITableViewCellAccessoryCheckmark;
                    coursemdl3.course_status=1;
                    //cell.selected = NO;
                    
                    
                }
                else if(cell.accessoryType==UITableViewCellAccessoryCheckmark)
                {
                    cell.accessoryType = UITableViewCellAccessoryNone;
                    coursemdl3.course_status=0;
                    //cell.selected=NO;
                    
                }
                
                
            }
            
        }
        
    }

    
    
    
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //UIButton *button=[[UIButton alloc]init];
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
    UITableView *table = (UITableView *)[cell superview];
    NSIndexPath *textFieldIndexPath = [table indexPathForCell:cell];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath.row);
    
    
    Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath.row];
    UITableViewCell *cell1 = (UITableViewCell *)[[yearbutton superview] superview];
    UITableView *table1 = (UITableView *)[cell1 superview];
    NSIndexPath *textFieldIndexPath1 = [table1 indexPathForCell:cell];
    NSLog(@"textFieldIndexPath%d",textFieldIndexPath1.row);
    Coursemdl*coursemdl3=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath1.row];
    
    
    
    
    if (tableView==_popOverTableView) {
        
        //Coursemdl*coursemdl2=(Coursemdl *)[_requirementArray objectAtIndex:textFieldIndexPath.row];
        
        switch (Poptype) {
                
            case 1:
                
                path=indexPath.row;
                [button setTitle:[_monthArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                coursemdl2.month=button.titleLabel.text;
                
                NSLog(@"_monthbtn.tag%@",coursemdl2.month);
                
                
                
                break;
            case 2:
                
                [yearbutton setTitle:[_yearArray objectAtIndex:indexPath.row] forState:UIControlStateNormal];
                
                coursemdl3.year=yearbutton.titleLabel.text;
                
                
                break;
            default:
                break;
        }
        //[_requirementArray addObject:coursemdl2];
        
    }
    if(tableView==_detailstable)
    {
        
        selectedcell=indexPath.row;
        _selectedcellstring=@"selected";
        [_detailstable reloadData];
    }
    if(tableView==_reqtable_iphone)
    {
        
        selectedcell=indexPath.row;
        NSLog(@"%d",indexPath.row);
        _selectedcellstring=@"selected";
        [_reqtable_iphone reloadData];
    }

}


#pragma mark - Webservice

-(void)InsertApplicantRequirements{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<InsertApplicantRequirements xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<JobId>%d</JobId>\n"
                   "<CraftId>%d</CraftId>\n"
                   "<AppId>%d</AppId>\n"
                   "</InsertApplicantRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",[_jobsiteid integerValue],[_craftid integerValue] ,_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/InsertApplicantRequirements" forHTTPHeaderField:@"Soapaction"];
    
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


-(void)UpdateApplicantRequirements
{
    for(int i=0;i<[_requirementArray count];i++)
    {
        recordResults = FALSE;
        NSInteger verifctnstatus=0;
            //NSInteger courseinteger=1;
        NSString*day=@"01";
       
       
       // NSLog(@"exdate%@",expirydate);

        Coursemdl*coursemdl1=(Coursemdl *)[_requirementArray objectAtIndex:i];
        
               NSInteger reqid=coursemdl1.reqid;
        NSString*mnth=[_monthDictionary objectForKey:coursemdl1.month];
         NSString*expirydate=[NSString stringWithFormat:@"%@-%@-%@",coursemdl1.year,mnth,day];
    
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UpdateApplicantRequirements xmlns=\"http://webserv.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "<JobId>%d</JobId>\n"
                   "<ReqId>%d</ReqId>\n"
                   "<ExpiryDate>%@</ExpiryDate>\n"
                   "<CourseStatus>%d</CourseStatus>\n"
                   "<VerificationStatus>%d</VerificationStatus>\n"
                   "</UpdateApplicantRequirements>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid,[_jobsiteid integerValue],reqid,expirydate,coursemdl1.course_status,verifctnstatus];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://webserv.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://webserv.kontract360.com/UpdateApplicantRequirements" forHTTPHeaderField:@"Soapaction"];
    
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
    
    
    [_detailstable reloadData];
    [_reqtable_iphone reloadData];
    
    
    
}



#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"InsertApplicantRequirementsResult"])
    {
        _requirementArray=[[NSMutableArray alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Requirement_Id"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    
    if([elementName isEqualToString:@"ItemName"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Code"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"ApplyToAllCraft"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"expir_date"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"course_status"])
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
          
    
    if([elementName isEqualToString:@"Requirement_Id"])
    {
        _coursemdl=[[Coursemdl alloc]init];
        recordResults = FALSE;
        _coursemdl.reqid=[_soapResults integerValue];
        
        _soapResults=nil;
    }
    
    
    if([elementName isEqualToString:@"ItemName"])
    {
        recordResults = FALSE;
        _coursemdl.itemname=_soapResults;
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"Code"])
    {
         recordResults = FALSE;
        _coursemdl.Code=_soapResults;
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"Type"])
    {
        recordResults = FALSE;
        _coursemdl.Type=_soapResults;
        
        _soapResults=nil;    }
    
    if([elementName isEqualToString:@"ApplyToAllCraft"])
    {
        recordResults = FALSE;
        
        _coursemdl.ApplyToAllCraft=_soapResults;
        _soapResults=nil;    }
    
    if([elementName isEqualToString:@"HaveExpiryDate"])
    {
        recordResults = FALSE;
        _coursemdl.HaveExpiryDate=_soapResults;
       
        
        _soapResults=nil;
    }
    if([elementName isEqualToString:@"expir_date"])
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
       // _drugmdl.drugdate=

        
          _coursemdl.expdate=myFormattedDate;
        NSArray*newarray=[myFormattedDate componentsSeparatedByString:@"-"];
//        _coursemdl.month=[newarray objectAtIndex:0];
//        _coursemdl.year=[newarray objectAtIndex:2];
        _coursemdl.month=[_remonthDictionary objectForKey:[newarray objectAtIndex:0]];
      _coursemdl.year=[newarray objectAtIndex:2];
      
    _soapResults=nil;
    }
    if([elementName isEqualToString:@"course_status"])
    {
        recordResults = FALSE;
        
        if ([_soapResults isEqualToString:@"true"]) {
            _coursemdl.course_status=1;
            
        }
       
        else if ([_soapResults isEqualToString:@"false"]){
             _coursemdl.course_status=0;
            
        }
         [_requirementArray addObject:_coursemdl];
        NSLog(@"mdl%@",_requirementArray);
        _soapResults=nil;
    }
    

    
   }


#pragma mark - Action

- (IBAction)continuebtn:(id)sender {
    [self UpdateApplicantRequirements];
    
//    if (!self.raceVCtrl) {
//        _raceVCtrl=[[RaceViewController alloc]initWithNibName:@"RaceViewController" bundle:nil];
//    }
//    _raceVCtrl.applicantId=_Applicantid;
//    [self.navigationController pushViewController:_raceVCtrl animated:YES];
}

-(IBAction)selectMonth:(id)sender
{
  
    Poptype=1;
     
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 60, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(60, 250);
    
    //create a popover controller
    self.popOverController1 = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    
    
button = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[button superview] superview];
     
        
    
    [self.popOverController1 presentPopoverFromRect:_monthbtn.frame
                                            inView:cell
                          permittedArrowDirections:UIPopoverArrowDirectionUp
                                          animated:YES];
    
    
  
 
}


-(IBAction)selectyear:(id)sender
{
    Poptype=2;
    UIViewController* popoverContent = [[UIViewController alloc]
                                        init];
    UIView* popoverView = [[UIView alloc]
                           initWithFrame:CGRectMake(0, 0, 60, 250)];
    //200,250
    popoverView.backgroundColor = [UIColor lightTextColor];
    _popOverTableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, 60, 250)];
    _popOverTableView.delegate=(id)self;
    _popOverTableView.dataSource=(id)self;
    _popOverTableView.rowHeight= 32;
    _popOverTableView.separatorColor=[UIColor cyanColor];
    
    [popoverView addSubview:_popOverTableView];
    popoverContent.view = popoverView;
    
    //resize the popover view shown
    //in the current view to the view's size
    popoverContent.contentSizeForViewInPopover = CGSizeMake(60, 250);
    
    //create a popover controller
    self.popOverController1 = [[UIPopoverController alloc]
                               initWithContentViewController:popoverContent];
    
    
    yearbutton = (UIButton *)sender;
    
    UITableViewCell *cell = (UITableViewCell *)[[yearbutton superview] superview];
    
    
    
        

    [self.popOverController1 presentPopoverFromRect:_yearbtn.frame
                                             inView:cell
                           permittedArrowDirections:UIPopoverArrowDirectionUp
                                           animated:YES];

}
-(IBAction)selectmonth_iphone:(id)sender
{
    monthbtn_iphone = (UIButton *)sender;
    
    //UITableViewCell *cell = (UITableViewCell *)[[monthbtn_iphone superview] superview];

    pickerstring=@"month";
    _monthpicker_iphone.hidden=NO;
    _yearpicker_iphone.hidden=YES;
    [_monthpicker_iphone reloadAllComponents];
}
-(IBAction)selectyear_iphone:(id)sender
{
    yearbtn_iphone = (UIButton *)sender;
    
    //UITableViewCell *cell = (UITableViewCell *)[[yearbtn_iphone superview] superview];
    pickerstring=@"year";
    _yearpicker_iphone.hidden=NO;
     _monthpicker_iphone.hidden=YES;
    [_yearpicker_iphone reloadAllComponents];
}
- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if([pickerstring isEqualToString:@"month"])
    {
        return [_monthArray count];
    }
    else
    {
        return [_yearArray count];
    }
    return YES;
    
}
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if([pickerstring isEqualToString:@"month"])
    {
        return [_monthArray objectAtIndex:row];
    }
    else if([pickerstring isEqualToString:@"year"])
    {
        return [_yearArray objectAtIndex:row];
    }
    
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    if([pickerstring isEqualToString:@"month"])
    {
        [ _month_iphone setTitle:[_monthArray objectAtIndex:row] forState:UIControlStateNormal];
        _monthpicker_iphone.hidden=YES;
        
    }
    else if([pickerstring isEqualToString:@"year"])
    {
        [ _year_iphone setTitle:[_yearArray objectAtIndex:row] forState:UIControlStateNormal];
        _yearpicker_iphone.hidden=YES;
        
    }
    
}


@end
