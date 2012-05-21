//
//  classFlicker.m
//  Bhaiyaji esmile
//
//  Created by nachi on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "classFlicker.h"
#import "SBJson.h"
#import "SearchUrlVIewControllerAppDelegate.h"
#import <CoreData/CoreData.h>
#import "DBHelper.h"
#import "SearchViewController.h"
@implementation classFlicker

@synthesize flickrtitle,flickrId;
@synthesize managedObjectContext;
@synthesize flickerSecret;

+(NSMutableArray *)getResponseData:(NSString*)responseData{
    
    
    
    NSDictionary *dictionary = [responseData JSONValue];
    NSDictionary *photoDictionary;
    
        
    NSMutableArray *resultArray=[[[NSMutableArray alloc]init]autorelease];
    
     for(int i=0;i<[dictionary count];i++)
     {
        
        NSString *strPhotos=[dictionary objectForKey:@"photos"];
        
        NSLog(@"PHOTO PAGE --%@",[strPhotos valueForKey:@"page"]);
    	    
        
        NSMutableArray *photosArray=[[[NSMutableArray alloc]init]autorelease];
        
        photosArray=[strPhotos valueForKey:@"photo"];
        
        NSLog(@"count= %d",[photosArray count]); 
        
        
         
        for (photoDictionary in photosArray)
        {
            classFlicker *flickerClass= [[classFlicker alloc]init];
            
            flickerClass.flickrId = [photoDictionary objectForKey:@"id"];            
            flickerClass.flickrtitle=[photoDictionary objectForKey:@"title"];
            flickerClass.flickerSecret=[photoDictionary objectForKey:@"secret"];
            
            [resultArray addObject:flickerClass];
            
        }
         
         
         NSLog(@"array= %d",[resultArray count]); 

         
    }
   
    return resultArray;
     
}

-(void)dealloc{
    [super dealloc];
    [flickrId release];
    [flickrtitle release];
    [flickerSecret release];
}

@end
