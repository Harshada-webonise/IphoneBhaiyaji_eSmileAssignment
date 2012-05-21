//
//  DBAdapter.m
//  Bhaiyaji esmile
//
//  Created by nachi on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "DBAdapter.h"
#import "classFlicker.h"

@implementation DBAdapter

-(id)init
{
    
    if(self!=nil)
    {
    [super init];
        [self setEntityName];
        [self setEntityColumnName];
    
    }
    
    return self;

}


-(void)setEntityName
{
    dbName=@"PhotoDetails";
}

-(void)setEntityColumnName
{
    columnName=[[NSArray alloc]initWithObjects:@"id",@"title",@"secret",nil];
}



-(void)createRecord:(classFlicker*)object
{
    
    NSArray *keyObject=[[NSArray alloc]initWithObjects:object.flickrId,object.flickrtitle,object.flickerSecret ,nil];
    
    NSArray *valueObject=[[NSArray alloc]initWithObjects:[columnName objectAtIndex:0],[columnName objectAtIndex:1],[columnName objectAtIndex:2] ,nil];

    
    NSMutableDictionary *keyValueDictionary=[NSMutableDictionary dictionaryWithObjects:keyObject forKeys:valueObject];
    
    NSLog(@"Dict..%@",keyValueDictionary);
    
    NSLog(@"Count %d",[keyValueDictionary count]);
    

    
    [super insertRecord:keyValueDictionary];
    
     
    
}


-(void)deleteAllRecord{
    
    [super deleteRecord];
    
}

-(NSArray*)retriveAllRecord{
    
    NSArray *getRecord=[super fetchRecord];
    return getRecord;
    
}


@end
