//
//  SearchViewController.h
//  Bhaiyaji esmile
//
//  Created by nachi on 16/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
{
    IBOutlet UITextField *txtSearch;
    IBOutlet UIButton *btnSearch;

    NSString *strURL;
    NSString *textSearch;
    
    
}
@property(nonatomic,retain) IBOutlet UITextField *txtSearch;
@property(nonatomic,retain) IBOutlet UIButton *btnSearch;
-(void)storeData:(NSString *)responceData;
@end
