//
//  DBAdapter.h
//  Bhaiyaji esmile
//
//  Created by nachi on 17/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBHelper.h"
@interface DBAdapter : DBHelper 



-(void)setEntityName;
-(void)setEntityColumnName;
-(void)createRecord:(NSObject*)object;

-(void)deleteAllRecord;
-(NSArray*)retriveAllRecord;

@end
