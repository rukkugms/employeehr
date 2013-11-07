//
//  ShowDocViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 10/18/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "ShowDocViewController.h"

@interface ShowDocViewController ()

@end

@implementation ShowDocViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"Document List", @"Document List");

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _documenttable.layer.borderWidth = 4.0;
    _documenttable.layer.borderColor = [UIColor colorWithRed:234.0/255.0f green:244.0/255.0f blue:249.0/255.0f alpha:1.0f].CGColor;
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    UIBarButtonItem *logoutbutton=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"logout1"] style:UIBarButtonItemStylePlain target:self action:@selector(logoutAction)];
    
    
    NSArray *buttons=[[NSArray alloc]initWithObjects:logoutbutton,nil];
    [self.navigationItem setRightBarButtonItems:buttons animated:YES];
  

    // Do any additional setup after loading the view from its nib.
}
-(void)logoutAction{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"LOGOUT" message:@"Really Logout?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    
    
    if (buttonIndex==0) {
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"logout" object:self userInfo:nil];
        
    }
    
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self selectdocs];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_docsarray count];
    // Return the number of rows in the section.
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        
    }
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text=[_docsarray objectAtIndex:indexPath.row];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _doc=[_docspathdict objectForKey:[_docsarray objectAtIndex:indexPath.row]];
    NSLog(@"%@",_doc);
    if (!self.webctrl) {
        _webctrl=[[webViewController alloc]initWithNibName:@"webViewController" bundle:nil];
    }
    _webctrl.docpdf=_doc;
    [self.navigationController pushViewController:_webctrl animated:YES];
    
    
}
-(void)selectdocs
{
    recordResults = FALSE;
    NSString *soapMessage;
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   "<soap:Body>\n"
                   "<SelectDocs xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<AppId>%d</AppId>\n"
                   "</SelectDocs>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    // NSURL *url = [NSURL URLWithString:@"http://192.168.0.146/link/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/SelectDocs" forHTTPHeaderField:@"Soapaction"];
    
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
    [_documenttable reloadData];
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict
{
    if([elementName isEqualToString:@"SelectDocsResult"])
    {
        _docsarray=[[NSMutableArray alloc]init];
        _docspathdict=[[NSMutableDictionary alloc]init];
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"Column1"])
    {
        if(!_soapResults)
        {
            _soapResults = [[NSMutableString alloc] init];
        }
        recordResults = TRUE;
    }
    if([elementName isEqualToString:@"FolderName"])
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
    
    if([elementName isEqualToString:@"Column1"])
    {
        recordResults=FALSE;
        NSLog(@"key%@",_soapResults);
        docsstring=_soapResults;
        
        
        _soapResults=nil;
    }
    
    if([elementName isEqualToString:@"FolderName"])
    {
        recordResults=FALSE;
        [_docsarray addObject:_soapResults];
        [_docspathdict setObject:docsstring forKey:_soapResults];
        NSLog(@"soap%@",_soapResults);
        _soapResults=nil;
    }

}

-(IBAction)adddocument:(id)sender
{
    if (!self.uplodctrl) {
        _uplodctrl=[[UploadDocViewController alloc]initWithNibName:@"UploadDocViewController_iphone" bundle:nil];
    }
    _uplodctrl.applicantid=_applicantid;
    [self.navigationController pushViewController:_uplodctrl animated:YES];

}


@end
