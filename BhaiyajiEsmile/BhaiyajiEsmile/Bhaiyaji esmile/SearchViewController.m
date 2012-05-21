//
//  SearchViewController.m
//  Bhaiyaji esmile
//
//  Created by nachi on 16/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SearchViewController.h"
#import "DisplayViewController.h"
#import "SBJsonParser.h"
#import "ASIFormDataRequest.h"
#import "classFlicker.h"
#import "SearchUrlVIewControllerAppDelegate.h"
#import "DBAdapter.h"


@implementation SearchViewController

@synthesize  txtSearch,btnSearch;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
   
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


-(void)getUrlString{
    
    NSString *const FlickrAPIKey =@"a70193cfa7a3e3b3670e1c13bf87a249";
    textSearch=txtSearch.text;
    
    strURL = 
    [NSString stringWithFormat:@"http://api.flickr.com/services/rest/?method=flickr.photos.search&api_key=%@&tags=%@&per_page=25&format=json&nojsoncallback=1", 
      FlickrAPIKey, textSearch];
    
    NSLog(@"URL String----%@",strURL);    
}

-(void)setASIHTTP_Request:(NSString *)urlString{
    
    
    //call ASIHTTP delegates (Used to connect to database)
    NSURL *url = [NSURL URLWithString:urlString];
    
    //This sets up all other request
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:url];
    
    
    NSLog(@"asihttp ur---%@", request);
    
    
    [request setDelegate:self];
    [request startSynchronous];
    
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
     
  //Use when fetching text data // Handle response
    NSString *responseString = [request responseString];
    
    NSLog(@"Responce-------------%@",responseString);
    
    [self storeData:responseString];
    
}

-(void)storeData:(NSString *)responceData{
    
    DBAdapter *dbAdapter=[[DBAdapter alloc]init];
    
    [dbAdapter deleteAllRecord];
    
    
    NSMutableArray* getArray=[[NSMutableArray alloc]init];
    
    getArray= [classFlicker getResponseData:responceData];
 
    for(int i=0;i<[getArray count];i++)
    {
        
        [dbAdapter createRecord:[getArray objectAtIndex:i]];
       
        
    }
    
    NSLog(@"cnt *****------ %d",[getArray count]);

}

-(void)startRequest{
    [self setASIHTTP_Request:strURL];
}


-(IBAction)onClickSearch:(id)sender{
    
    [self getUrlString];
    [self startRequest];
    
    
      
    DisplayViewController *displayContoller=[[DisplayViewController alloc]initWithNibName:@"DisplayViewController" bundle:nil];
    
    
    
    [self.view addSubview:displayContoller.view];
    
    
}

-(void)dealloc
{
    [super dealloc];
    [txtSearch release];
    [btnSearch release];
}

@end
