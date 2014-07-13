//
//  DetailViewController.h
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/15.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface DetailViewController : UIViewController{
    IBOutlet UILabel *label;
    NSMutableArray *userArray;
    IBOutlet UITableView *table;
}
@property NSInteger rowNumber;
@property NSString *name;

@end
