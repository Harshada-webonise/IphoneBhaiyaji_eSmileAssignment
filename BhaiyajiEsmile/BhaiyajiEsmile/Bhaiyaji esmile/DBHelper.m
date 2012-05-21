//
//  DBHelper.m
//  Bhaiyaji esmile
//
//  Created by nachi on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBHelper.h"
#import "SearchUrlVIewControllerAppDelegate.h"

@implementation DBHelper
@synthesize managedObjectContext,dbName,columnName;

-(void)insertRecord:(NSDictionary*)record
{

    SearchUrlVIewControllerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext=[appDelegate managedObjectContext];
    
    NSManagedObject *newManagedObject=[NSEntityDescription insertNewObjectForEntityForName:dbName inManagedObjectContext:[self managedObjectContext]];

    [newManagedObject setValue:[record objectForKey:@"id"] forKey:@"id"];
    [newManagedObject setValue:[record objectForKey:@"title"] forKey:@"title"];
    [newManagedObject setValue:[record objectForKey:@"secret"] forKey:@"secret"];


    for (id key in record) {
          [newManagedObject setValue:[record objectForKey:key] forKey:key];
    }
    
    [self saveContext];
    

}

- (void)saveContext

{
    
    NSError *error = nil;
    
  
    
    if (managedObjectContext != nil)
        
    {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error])
        {
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            
            abort();
            
        }
        
    }
    
}       


-(NSArray*)fetchRecord{
    
    SearchUrlVIewControllerAppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    managedObjectContext=[appDelegate managedObjectContext];

    NSFetchRequest *request = [[[NSFetchRequest alloc] init] autorelease];
    NSEntityDescription *entity = [NSEntityDescription entityForName:dbName inManagedObjectContext:[self managedObjectContext]];
    
    [request setEntity:entity];
    
    NSError *errorFetch = nil;
    arrayRecord = [managedObjectContext executeFetchRequest:request error:&errorFetch];  
   
    return arrayRecord;
    
}


-(void)deleteRecord
{
  
    NSArray *photoDetails  =[self fetchRecord];
   
    //error handling goes here
    for (NSManagedObject * photoManage in photoDetails) {
        [[self managedObjectContext] deleteObject:photoManage];
    }
    NSError *saveError = nil;
    [[self managedObjectContext] save:&saveError];

}

- (void)dealloc {
    [super dealloc];
}
@end
