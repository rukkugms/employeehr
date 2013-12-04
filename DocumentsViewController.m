//
//  DocumentsViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 10/18/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "DocumentsViewController.h"

@interface DocumentsViewController ()

@end

@implementation DocumentsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"UploadDocuments", @"UploadDocuments");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    /*Table Boarder*/
    _Docmnttable.layer.borderWidth = 2.0;
    _Docmnttable.layer.borderColor = [UIColor colorWithRed:0/255.0f green:191/255.0f blue:255.0/255.0f alpha:1.0f].CGColor;
    
    /*Navigation Barbuttons*/
    _activityndictr=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
     UIBarButtonItem*barbutton=[[UIBarButtonItem alloc]initWithCustomView:_activityndictr];
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    UIImage *buttonImage = [UIImage imageNamed:@"logout1"];
    UIBarButtonItem *logoutbutton=[[UIBarButtonItem alloc]initWithImage:[buttonImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(logoutAction)];
    
    NSArray *buttons=[[NSArray alloc]initWithObjects:logoutbutton,barbutton,nil];
    [self.navigationItem setRightBarButtonItems:buttons animated:YES];
    self.navigationController.navigationBarHidden=NO;

    
   // [self SelectDocuments];
   
    
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self SelectDocuments];
}




#pragma mark-Alertview Delegate

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
     
    
    
    if (buttonIndex==0) {
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"logout" object:self userInfo:nil];
        
    }
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-Webservice

-(void)SelectDocuments{
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
    
    
   NSURL*url=[NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
     // NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
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
    
    
    [_Docmnttable reloadData];
    
}

#pragma mark-Tableview Datasource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
     // Return the number of sections.
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
     // Return the number of rows.
    return [_DocumentDictionary count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"mycell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    }
    
    _DoculistArray=[_DocumentDictionary allKeys];
    cell.textLabel.text=[_DoculistArray objectAtIndex:indexPath.row];
    return cell;
}



#pragma mark-Tableview Delegate


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *header=@"http://";
    _DoculistArray=[_DocumentDictionary allKeys];
    NSString *urlstring=[NSString stringWithFormat:@"%@%@",header,[_DocumentDictionary objectForKey:[_DoculistArray objectAtIndex:indexPath.row]]];
    
    NSLog(@"reportname%@",urlstring);
    NSURL *targetURL = [NSURL URLWithString:urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:targetURL];
    [_webview loadRequest:request];
    [_activityndictr startAnimating];
    

    
}
#pragma mark-Webview delegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [_activityndictr stopAnimating];
}

#pragma mark-Button Actions

-(void)logoutAction{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"LOGOUT" message:@"Really Logout?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
}

- (IBAction)Adddocbtn:(id)sender {
    if(!self.uploadVCtrl){
        self.uploadVCtrl=[[UploadDocViewController alloc]initWithNibName:@"UploadDocViewController" bundle:nil];
    }
    _uploadVCtrl.applicantid=_applicantid;
    [self.navigationController presentViewController:_uploadVCtrl animated:YES completion:nil];
    
}

#pragma mark - XMLParser
-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *) namespaceURI qualifiedName:(NSString *)qName
   attributes: (NSDictionary *)attributeDict{
    if([elementName isEqualToString:@"SelectDocsResult"])
    {
    // _DoculistArray=[[NSMutableArray alloc]init];
        _DocumentDictionary=[[NSMutableDictionary alloc]init];
        
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
    if([elementName isEqualToString:@"Column1"])
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
        recordResults = FALSE;
       
          [_DocumentDictionary setObject:_soapResults forKey:_Unitstring];
        _soapResults=nil;
    }

    if([elementName isEqualToString:@"FolderName"])
    {
        
        recordResults = FALSE;
         _Unitstring=_soapResults;
      

        
        _soapResults=nil;
    }
    
    
  }
@end
