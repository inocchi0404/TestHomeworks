//
//  ViewController.h
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/15.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *table;
    
    NSMutableArray *nameArray;
    NSMutableArray *imageArray;
    NSMutableArray *proArray;
}

@end
