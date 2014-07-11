//
//  ViewController.h
//  TestHomeworks
//
//  Created by Inocchi on 2014/06/15.
//  Copyright (c) 2014年 Inocchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "DetailViewController.h"

@interface ViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate,UIGestureRecognizerDelegate>
{
    IBOutlet UITableView *table;
    
    NSMutableArray *nameArray;
    NSMutableArray *imageArray;
    NSMutableArray *proArray;
    
    IBOutlet UITextField *name1;
    IBOutlet UITextField *name2;
    IBOutlet UILabel *name3;
    IBOutlet UILabel *pass;
    
    NSMutableArray *userArray;
}

-(IBAction)load;

@end
