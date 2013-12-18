//
//  UploadImageViewController.m
//  EmployeeHrPortal
//
//  Created by GMSIndia1 on 9/18/13.
//  Copyright (c) 2013 GMSIndia1. All rights reserved.
//

#import "UploadImageViewController.h"
#import "Base64.h"
@interface UploadImageViewController ()

@end

@implementation UploadImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title=NSLocalizedString(@"UploadImage", @"UploadImage");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self FetchImage];
    // Do any additional setup after loading the view from its nib.
    _scrollview.frame=CGRectMake(0, 0,320, 548);
    [ _scrollview setContentSize:CGSizeMake(320,7000)];
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    self.navigationController.navigationBar.tintColor=[[UIColor alloc]initWithRed:16/255.0f green:78/255.0f blue:139/255.0f alpha:1];
    self.navigationController.navigationBar.translucent = NO;
    UIImage *buttonImage = [UIImage imageNamed:@"logout1"];
    UIBarButtonItem *logoutbutton=[[UIBarButtonItem alloc]initWithImage:[buttonImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(logoutAction)];
    
    
    NSArray *buttons=[[NSArray alloc]initWithObjects:logoutbutton,nil];
    [self.navigationItem setRightBarButtonItems:buttons animated:YES];
    self.navigationController.navigationBarHidden=NO;

}
-(void)logoutAction{
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"LOGOUT" message:@"Really Logout?" delegate:self cancelButtonTitle:@"Yes" otherButtonTitles:@"No", nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    ////NSLog(@"buttonIndex%d",buttonIndex);
    
    
    
    if ([alertView.message isEqualToString:@"Really Logout?"]) {
        
        
        
        if (buttonIndex==0) {
        
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"logout" object:self userInfo:nil];
        
    }
    }
    
}



#pragma mark - Uploadimage


-(void)UploadImage{
    recordResults = FALSE;
    NSString *soapMessage;
  
    // NSString *cmpnyname=@"arvin";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *fetchVariable = [defaults objectForKey:@"app"];
    NSString *ssn = [defaults objectForKey:@"ssn"];
    
    NSString *imagename=[NSString stringWithFormat:@"Photo_%@.png",ssn];
    NSLog(@"%@",fetchVariable);
 // NSString *imagename=[NSString stringWithFormat:@"Photo_%@",];
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<UploadImage xmlns=\"http://arvin.kontract360.com/\">\n"
                   "<f>%@</f>\n"
                   "<fileName>%@</fileName>\n"
                    "<appid>%d</appid>\n"
                   "</UploadImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_encodedString,imagename,[fetchVariable integerValue]];
    NSLog(@"soapmsg%@",soapMessage);
    
    
   // NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/UploadImage" forHTTPHeaderField:@"Soapaction"];
    
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
-(void)FetchImage{
    recordResults = FALSE;
    NSString *soapMessage;
    
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    NSString *fetchVariable = [defaults objectForKey:@"app"];
  
    
    
    // NSString *cmpnyname=@"arvin";
    
    soapMessage = [NSString stringWithFormat:
                   
                   @"<?xml version=\"1.0\" encoding=\"utf-8\"?>\n"
                   "<soap:Envelope xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\" xmlns:xsd=\"http://www.w3.org/2001/XMLSchema\" xmlns:soap=\"http://schemas.xmlsoap.org/soap/envelope/\">\n"
                   
                   
                   "<soap:Body>\n"
                   
                   "<FetchImage xmlns=\"http://arvin.kontract360.com/\">\n"
                   
                   "<appid>%d</appid>\n"
                   "</FetchImage>\n"
                   "</soap:Body>\n"
                   "</soap:Envelope>\n",_Applicantid];
    NSLog(@"soapmsg%@",soapMessage);
    
    
    //NSURL *url = [NSURL URLWithString:@"http://192.168.0.1/service.asmx"];
    NSURL *url = [NSURL URLWithString:@"http://arvin.kontract360.com/service.asmx"];
    
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url];
    
    NSString *msgLength = [NSString stringWithFormat:@"%d", [soapMessage length]];
    
    [theRequest addValue: @"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    
    [theRequest addValue: @"http://arvin.kontract360.com/FetchImage" forHTTPHeaderField:@"Soapaction"];
    
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




- (void)handlePinch:(UITapGestureRecognizer *)pinchGestureRecognizer
{
    //handle pinch...
    if ([UIImagePickerController isSourceTypeAvailable:
         UIImagePickerControllerSourceTypeCamera])
    {
        
        
        UIImagePickerController *imagePicker =
        [[UIImagePickerController alloc] init];
        imagePicker.delegate = self;
        imagePicker.sourceType =
        UIImagePickerControllerSourceTypeCamera;
        imagePicker.showsCameraControls=YES;
        
        imagePicker.mediaTypes = [NSArray arrayWithObjects:
                                  (NSString *) kUTTypeImage,
                                  nil];
        imagePicker.allowsEditing = NO;
        // imagePicker.cameraCaptureMode=YES;
        [self presentModalViewController:imagePicker
                                animated:YES];
        _newMedia = YES;
    }
}
-(void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // [self.popoverController dismissPopoverAnimated:true];
    NSString *mediaType = [info
                           objectForKey:UIImagePickerControllerMediaType];
    
    
    
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage]) {
        UIImage *image = [info
                          objectForKey:UIImagePickerControllerOriginalImage];
        NSLog(@"dict%@",info);
//        UIGraphicsBeginImageContext(CGSizeMake(480,320));
//        
//        CGContextRef            context = UIGraphicsGetCurrentContext();
//        
//        [image drawInRect: CGRectMake(0, 0, 480, 320)];
//        
//        UIImage        *smallImage = UIGraphicsGetImageFromCurrentImageContext();
//        
//        UIGraphicsEndImageContext();
        

        
        _imageview.image =image;
        [self dismissModalViewControllerAnimated:YES];
        if (_newMedia)
            UIImageWriteToSavedPhotosAlbum(image,
                                           self,
                                           @selector(image:finishedSavingWithError:contextInfo:),
                                           nil);
    }
    
    
    
}

-(void)image:(UIImage *)image
finishedSavingWithError:(NSError *)error
 contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: @"Save failed"
                              message: @"Failed to save image"
                              delegate: nil
                              cancelButtonTitle:@"OK"
                              otherButtonTitles:nil];
        [alert show];
    }
    
    else{
        
        [self dismissModalViewControllerAnimated:YES];
        
    }
}
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    
    
    // [self dismissModalViewControllerAnimated:YES];
    
}

- (IBAction)upload:(id)sender {
    UIImage *image =_imageview.image;
    NSLog(@"image%@",image);
    NSData *data = UIImagePNGRepresentation(image);
//     NSData *data = UIImageJPEGRepresentation(image, 1.0);
    _encodedString = [data base64EncodedString];
    
    NSLog(@"result%@",_encodedString);
    
    [self UploadImage];

    
    
}
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
    
    if([elementName isEqualToString:@"url"])
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
       
    
        
    
    
    
        
    
    
         if([elementName isEqualToString:@"url"])
    {
        
        recordResults = FALSE;
        
            NSData *data1=[_soapResults base64DecodedData];
            
            UIImage *image1=[[UIImage alloc]initWithData:data1];
            _imageview.image=image1;
            
            
        }
        
        _soapResults = nil;
    }
    

@end
