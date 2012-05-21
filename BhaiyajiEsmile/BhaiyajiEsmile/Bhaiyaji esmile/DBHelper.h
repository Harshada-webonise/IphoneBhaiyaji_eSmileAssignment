//
//  DBHelper.h
//  Bhaiyaji esmile
//
//  Created by nachi on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBHelper : NSObject
{
    
    NSManagedObjectContext *managedObjectContext;
    NSString *dbName;
    NSArray *columnName;
    NSArray *arrayRecord;
}

@property(nonatomic,strong)NSManagedObjectContext *managedObjectContext;
@property(nonatomic,retain) NSString *dbName;
@property(nonatomic,retain) NSArray *columnName;



-(void)insertRecord:(NSDictionary*)record;
-(NSArray*)fetchRecord;
-(void)saveContext;
-(void)deleteRecord;
@end
