//
//  DisplayViewController.h
//  Bhaiyaji esmile
//
//  Created by nachi on 15/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DisplayViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    IBOutlet UITableView *tblView;
    IBOutlet UITableViewCell *customViewCell;
    IBOutlet UILabel *lbl;
    NSArray *retriveArray;
    int size;
}

@property(nonatomic,retain) IBOutlet UITableView *tblView;
@property(nonatomic,retain)IBOutlet UITableViewCell *customViewCell;
@property(nonatomic,retain) IBOutlet UILabel *lbl;
@property(nonatomic)int size;

@end
