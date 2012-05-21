//
//  classFlicker.h
//  Bhaiyaji esmile
//
//  Created by nachi on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface classFlicker : NSObject
{
    NSString* flickrId;
    NSString* flickrtitle;
    NSString* flickerSecret;
    
    NSManagedObjectContext *managedObjectContext;
}

@property(nonatomic,retain)NSString* flickrtitle;
@property(nonatomic,retain)NSString* flickrId;
@property(nonatomic,retain)NSString* flickerSecret;

@property(nonatomic,retain)NSManagedObjectContext *managedObjectContext;

+(NSMutableArray *)getResponseData:(NSString*)responseData;


@end 