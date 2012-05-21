//
//  DisplayViewController.m
//  Bhaiyaji esmile
//
//  Created by nachi on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DisplayViewController.h"
#include "DBAdapter.h"

@implementation DisplayViewController

@synthesize tblView,customViewCell,lbl,size;

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
    tblView.delegate=self;
    tblView.dataSource=self;
    
    
    DBAdapter *dbAdap=[[DBAdapter alloc]init];
    retriveArray=[[NSArray alloc]init];
    
    retriveArray=[dbAdap retriveAllRecord];
    
    size=[retriveArray count];
    NSLog(@"array count %d",[retriveArray count]);

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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return size;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    NSDictionary *dictionary=[retriveArray objectAtIndex:section];
//    NSArray *array=[dictionary objectForKey:@"title"];
//    return [array count];
    return 2;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"flickerCell";

    
    UITableViewCell *cell = [tblView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        
        [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell = self.customViewCell;
        
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
  
       
//        NSDictionary *dictionary=[retriveArray objectAtIndex:indexPath.row];
//        NSArray *array=[dictionary objectForKey:@"title"];
//        NSString *cellValue=[array objectAtIndex:indexPath.row];

        
        cell.textLabel.text=[retriveArray objectAtIndex:indexPath.row];

  
        
     // cell.textLabel.text=cellValue;
        
    }
    
    //lbl.text=@"Hi";
    
    // Configure the cell...
   
    //

    return cell;
}



-(void)dealloc{
    
    [super dealloc];
    [tblView release];
    [customViewCell release];
    [lbl release];
}


@end
